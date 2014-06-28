The Alchemist
============

[![Build Status](https://travis-ci.org/vertexclique/thealchemist.svg?branch=master)](https://travis-ci.org/vertexclique/thealchemist)

Elixir implementation bundle for MessagePack

<img src="http://www.whats-your-sign.com/images/AlchemySymbols.jpg" alt="The Alchemist" style="width: 300px;">

Elixir implementation relies on `mururu/msgpack-elixir`
[![GitHub version](https://badge.fury.io/gh/mururu%2Fmsgpack-elixir.svg)](http://badge.fury.io/gh/mururu%2Fmsgpack-elixir)

Pure erlang implementation used with `msgpack/msgpack-erlang`
[![GitHub version](https://badge.fury.io/gh/msgpack%2Fmsgpack-erlang.svg)](http://badge.fury.io/gh/msgpack%2Fmsgpack-erlang)

## Usage

### In pure elixir:

```elixir
# pack
TheAlchemist.pack([1,2,3]) #=> { :ok, <<147,1,2,3>> }
TheAlchemist.pack!([1,2,3]) #=> <<147,1,2,3>>

# unpack
TheAlchemist.unpack(<<147,1,2,3>>) #=> { :ok, [1,2,3] }
TheAlchemist.unpack!(<<147,1,2,3>>) #=> [1,2,3]

# unpack_once
TheAlchemist.unpack_once(<<147,1,2,3,4>>) #=> {:ok, {[1, 2, 3], <<4>>}}
TheAlchemist.unpack_once!(<<147,1,2,3,4>>) #=> {[1, 2, 3], <<4>>}

```

### With underlying erlang:

#### Deserialization

```elixir
msgpacked = TheAlchemistErl.pack('{"test":false}')
TheAlchemistErl.unpack(msgpacked)
```

#### Stream deserialization

```elixir
mat = TheAlchemistErl.unpack_stream(data)
TheAlchemistErl.unpack_stream(elem(mat, 1)),
```

#### String type

Now this supports string type!

```elixir
opt = [{:enable_str, true}]
TheAlchemistErl.unpack(TheAlchemistErl.pack("埼玉kanji", opt), opt)
 => {:ok, "埼玉kanji"}
```

#### Map Style

Since Erlang/OTP 17.0

```erlang
msgpack:pack(#{ <<"key">> => <<"value">> }, [{format, map}]).
```

Or use old jiffy/jsx style

```erlang
msgpack:pack({[{<<"key">>, <<"value">>}]}, [{format, jiffy}]),
msgpack:pack([{<<"key">>, <<"value">>}], [{format, jsx}]).
```

## Running interactively

Firstly `make all` to ensure all source files are compiled
after that you can bring the `ERL shell` with

`make run`

If you want to bring the `IEX` you can type

`make runex`