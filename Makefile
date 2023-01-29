all:
	mkdir -p lua/config
	gcc -o init.so -std=gnu11 -O2 init.c -shared -fPIC
	gcc -o lua/config/options.so -std=gnu11 -O2 src/config/options.c -shared -fPIC
	gcc -o lua/config/keymaps.so -std=gnu11 -O2 src/config/keymaps.c -shared -fPIC
# clean:
# 	rm -rf lua/
