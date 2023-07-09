all:
	mkdir -p lua/config
	gcc -o lua/init.so init.c -std=gnu11 -O2 -shared -fPIC -Wl,-undefined -Wl,dynamic_lookup
	gcc -o lua/config/options.so src/config/options.c -std=gnu11 -O2 -shared -fPIC -Wl,-undefined -Wl,dynamic_lookup
	gcc -o lua/config/keymaps.so src/config/keymaps.c -std=gnu11 -O2 -shared -fPIC -Wl,-undefined -Wl,dynamic_lookup
clean:
	rm -rf init.so
	rm -rf lua/
