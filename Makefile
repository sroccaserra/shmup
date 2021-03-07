PICO_8 ?= $(HOME)/Applications/Games/PICO-8/PICO-8.app/Contents/MacOS/pico8

LUA_FILES := $(wildcard carts/*.lua)

.PHONY: test
test: tmp/main.lua
	docker run --rm -t -v $(shell pwd):/app -w /app shmup-test busted

tmp/main.lua: $(LUA_FILES)
	mkdir -p tmp
	cat carts/*.lua > tmp/main.lua

build:
	docker build -t shmup-test .

.PHONY: run
run:
	$(PICO_8) -root_path carts -run carts/shmup.p8
