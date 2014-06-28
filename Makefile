
export PATH := $(PATH)
PROJECT=thealchemist
LDFLAGS=-Lpriv -L/usr/lib/erlang/usr/lib
UNAME := $(shell uname)
IEX := $(shell which iex)
CURDIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
ELIXIRVER=0.14.1
MIX := $(shell which mix)
ifeq ($(UNAME),Darwin)
	MIX=/usr/local/Cellar/elixir/$(ELIXIRVER)/bin/mix
endif

GETELIXIR := wget https://github.com/elixir-lang/elixir/archive/v$(ELIXIRVER).tar.gz

SHELLARGSERL=-setcookie TheAlchemist \
			-pz $(CURDIR)/deps/msgpack/ebin

SHELLARGSEX=--cookie "TheAlchemist" \
			-pz $(CURDIR)/deps/msgpack/ebin \
			-r $(CURDIR)/lib/thealchemisterl.ex \
			-r $(CURDIR)/lib/packer.ex \
			-r $(CURDIR)/lib/unpacker.ex \
			-r $(CURDIR)/lib/ext.ex \
			-r $(CURDIR)/lib/thealchemist.ex

all: getdeps makedeps compile

getdeps:
	$(MIX) deps.get

makedeps:
	$(MIX) deps.compile

compile:
	$(MIX) compile

clean:
	$(MIX) deps.clean --all

cleanall:
	$(MIX) clean && $(MIX) deps.clean --all

getelixir:
	$(GETELIXIR)

run:
	erl -sname $(PROJECT) $(SHELLARGSERL)

runex:
	iex --sname "$(PROJECT)ELIXIR" $(SHELLARGSEX)