SHELL := /bin/sh

ROOT := $(CURDIR)

FASMG  := $(ROOT)/bin/fasmg
ELFUSE := $(ROOT)/bin/elfuse
INCLUDE := $(ROOT)/include # This is to force fasmg to us the local INCLUDE!

SRC := src/hello.asm
OUT := build/hello

.PHONY: all build run clean check tools

all: build

build: $(OUT)

$(OUT): $(SRC)
	@mkdir -p $(dir $@)
	@echo "  ASM     $<"
	INCLUDE="$(INCLUDE)" "$(FASMG)" "$<" "$@"

run: $(OUT)
	@echo "  RUN     $<"
	"$(ELFUSE)" "$(OUT)"

check: $(OUT)
	@file "$(OUT)"
	@echo
	@echo "ELF header:"
	@greadelf -h "$(OUT)"
	@echo
	@echo "Program headers:"
	@greadelf -lW "$(OUT)"

clean:
	rm -rf build/*
