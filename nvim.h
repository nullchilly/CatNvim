// Reference: https://github.com/neovim/neovim/blob/master/src/nvim/api/private/defs.h
#ifndef NVIM_H
#define NVIM_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ARRAY_DICT_INIT KV_INITIAL_VALUE
#define STRING_INIT                                                            \
  { .data = NULL, .size = 0 }
#define OBJECT_INIT                                                            \
  { .type = kObjectTypeNil }
#define ERROR_INIT                                                             \
  { .type = kErrorTypeNone, .msg = NULL }

// #include "klib/kvec.h"
#define kvec_t(type)                                                           \
  struct {                                                                     \
    size_t size;                                                               \
    size_t capacity;                                                           \
    type *items;                                                               \
  }

// Basic types
typedef enum {
  kErrorTypeNone = -1,
  kErrorTypeException,
  kErrorTypeValidation,
} ErrorType;

typedef struct {
  ErrorType type;
  char *msg;
} Error;

typedef bool Boolean;
typedef int64_t Integer;
typedef double Float;

typedef struct {
  char *data;
  size_t size;
} String;

typedef struct object Object;
typedef kvec_t(Object) Array;

typedef struct key_value_pair KeyValuePair;
typedef kvec_t(KeyValuePair) Dictionary;

typedef enum {
  kObjectTypeNil = 0,
  kObjectTypeBoolean,
  kObjectTypeInteger,
  kObjectTypeFloat,
  kObjectTypeString,
  kObjectTypeArray,
  kObjectTypeDictionary,
  kObjectTypeLuaRef,
  // EXT types, cannot be split or reordered, see #EXT_OBJECT_TYPE_SHIFT
  kObjectTypeBuffer,
  kObjectTypeWindow,
  kObjectTypeTabpage,
} ObjectType;

// List of possible XDG variables
typedef enum {
  kXDGNone = -1,
  kXDGConfigHome, ///< XDG_CONFIG_HOME
  kXDGDataHome,   ///< XDG_DATA_HOME
  kXDGCacheHome,  ///< XDG_CACHE_HOME
  kXDGStateHome,  ///< XDG_STATE_HOME
  kXDGRuntimeDir, ///< XDG_RUNTIME_DIR
  kXDGConfigDirs, ///< XDG_CONFIG_DIRS
  kXDGDataDirs,   ///< XDG_DATA_DIRS
} XDGVarType;

typedef int LuaRef;
struct object {
  ObjectType type;
  union {
    Boolean boolean;
    Integer integer;
    Float floating;
    String string;
    Array array;
    Dictionary dictionary;
    LuaRef luaref;
  } data;
};

#endif // NVIM_API_PRIVATE_DEFS_H

#define Dict(name) KeyDict_##name

typedef struct {
  Object scope;
  Object win;
  Object buf;
} KeyDict_option;

typedef struct {
  Object desc;
  Object expr;
  Object script;
  Object silent;
  Object unique;
  Object nowait;
  Object noremap;
  Object callback;
  Object replace_keycodes;
} KeyDict_keymap;

#define True                                                                   \
  (Object) { .type = kObjectTypeBoolean, .data.boolean = true }
#define False                                                                  \
  (Object) { .type = kObjectTypeBoolean, .data.boolean = true }

extern char *stdpaths_get_xdg_var(const XDGVarType idx);
extern char *stdpaths_user_data_subpath(const char *fname);
extern bool os_isdir(const char *name);
extern char *runtimepath_default(bool clean_arg);
extern void nvim_set_option_value(String name, Object value,
                                  Dict(option) * opts, Error *err);
extern char *concat_str(const char *restrict str1, const char *restrict str2);
void opt(char *k, char *old, char *new) {
  KeyDict_option o = {};
  Error e = ERROR_INIT;
  char *x = concat_str(concat_str(old, ","), new);
  Object v = {.type = kObjectTypeString,
              .data.string = (String){x, strlen(x) - 1}};
  nvim_set_option_value((String){.data = k, .size = strlen(k)}, v, &o, &e);
}

#define ms(x)                                                                  \
  (String) { x, sizeof(x) / sizeof(char) - 1 }
void nvim_set_keymap(uint64_t channel_id, String mode, String lhs, String rhs,
                     Dict(keymap) * opts, Error *err);
#define map(m, l, r)                                                           \
  do {                                                                         \
    KeyDict_keymap o = {.noremap = True, .silent = True};                      \
    Error e = ERROR_INIT;                                                      \
    nvim_set_keymap(0, ms(m), ms(l), ms(r), &o, &e);                           \
  } while (0)

#define fs(x)                                                                  \
  (String) { x, strlen(x) }

void nvim_set_keymap(uint64_t channel_id, String mode, String lhs, String rhs,
                     Dict(keymap) * opts, Error *err);

#define fmap(m, lhs, rhs, i)                                                   \
  do {                                                                         \
    KeyDict_keymap o = {.noremap = True, .silent = True};                      \
    Error e = ERROR_INIT;                                                      \
    char l[] = lhs, r[] = rhs;                                                 \
    sprintf(l, l, i), sprintf(r, r, i);                                        \
    nvim_set_keymap(0, fs(m), fs(l), fs(r), &o, &e);                           \
  } while (0)

#define i(x)                                                                   \
  (Object) { .type = kObjectTypeInteger, .data.integer = x }
#define s(x)                                                                   \
  (Object) {                                                                   \
    .type = kObjectTypeString, .data.string = (String) {                       \
      x, sizeof(x) / sizeof(char) - 1                                          \
    }                                                                          \
  }

extern void nvim_set_var(String name, Object value, Error *err);
#define g(k, v)                                                                \
  do {                                                                         \
    Error e = ERROR_INIT;                                                      \
    nvim_set_var((String){.data = k, .size = sizeof(k) / sizeof(char) - 1}, v, \
                 &e);                                                          \
  } while (0)

extern void nvim_set_option_value(String name, Object value,
                                  Dict(option) * opts, Error *err);
#define o(k, v)                                                                \
  do {                                                                         \
    KeyDict_option o = {};                                                     \
    Error e = ERROR_INIT;                                                      \
    nvim_set_option_value(                                                     \
        (String){.data = k, .size = sizeof(k) / sizeof(char) - 1}, v, &o, &e); \
  } while (0)

extern bool has_nvim_version(const char *const version_str);

// Sorry I don't want to copy the entire lua-cjson just to avoid using lua api
#define luaL_reg luaL_Reg
typedef struct lua_State lua_State;
#define LUA_API extern
#define LUA_GLOBALSINDEX (-10002)
#define LUA_MULTRET (-1)
#define lua_pushliteral(L, s)                                                  \
  lua_pushlstring(L, "" s, (sizeof(s) / sizeof(char)) - 1)
LUA_API void(lua_pushlstring)(lua_State *L, const char *s, size_t l);
LUA_API void(lua_getfield)(lua_State *L, int idx, const char *k);
LUA_API void(lua_gettable)(lua_State *L, int idx);
LUA_API int(lua_gettop)(lua_State *L);
LUA_API void(lua_remove)(lua_State *L, int idx);
LUA_API void(lua_call)(lua_State *L, int nargs, int nresults);
LUA_API void(lua_concat)(lua_State *L, int n);
LUA_API void(lua_insert)(lua_State *L, int idx);
LUA_API void(lua_pushvalue)(lua_State *L, int idx);

#define require_setup(m, s)                                                    \
  do {                                                                         \
    lua_getfield(L, LUA_GLOBALSINDEX, "require");                              \
    lua_pushliteral(L, m);                                                     \
    lua_call(L, 1, 1);                                                         \
    lua_pushliteral(L, "setup");                                               \
    lua_gettable(L, -2);                                                       \
    lua_remove(L, -2);                                                         \
    const int lc3 = lua_gettop(L);                                             \
    lua_getfield(L, LUA_GLOBALSINDEX, "vim");                                  \
    lua_pushliteral(L, "json");                                                \
    lua_gettable(L, -2);                                                       \
    lua_remove(L, -2);                                                         \
    lua_pushliteral(L, "decode");                                              \
    lua_gettable(L, -2);                                                       \
    lua_remove(L, -2);                                                         \
    lua_pushliteral(L, s);                                                     \
    lua_call(L, 1, LUA_MULTRET);                                               \
    lua_call(L, (lua_gettop(L) - lc3), 0);                                     \
  } while (0)
