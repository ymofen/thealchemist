The Alchemist
============

Elixir implementation bundle for MessagePack

Elixir implementation relies on `mururu/msgpack-elixir`
[![GitHub version](https://badge.fury.io/gh/mururu%2Fmsgpack-elixir@2x.png)](http://badge.fury.io/gh/mururu%2Fmsgpack-elixir)

Pure erlang implementation used with `msgpack/msgpack-erlang`
[![GitHub version](https://badge.fury.io/gh/msgpack%2Fmsgpack-erlang@2x.png)](http://badge.fury.io/gh/msgpack%2Fmsgpack-erlang)

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

### In underlying erlang:

#### Simple deserialization

```erlang
Ham = msgpack:pack(Spam),
{ok, Spam} = msgpack:unpack(Ham).
```

#### Stream deserialization

```erlang
{Term0, Rest0} = msgpack:unpack_stream(Binary),
{Term1, Rest1} = msgpack:unpack_stream(Rest0),
...
```

#### String type

Now this supports string type!

```erlang
Opt = [{enable_str, true}]
{ok, "埼玉"} = msgpack:unpack(msgpack:pack("埼玉", Opt), Opt).
 => {ok,[22524,29577]}
```

There are several options for `msgpack:pack/2` and `msgpack:unpack/2` .
See `msgpack:options()` in `msgpack.hrl`.

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

#### Ext type

Now msgpack-erlang supports ext type. Now you can serialize everything
with your original (de)serializer. That will enable us to handle
erlang- native types like `pid()`, `ref()` contained in `tuple()`. See
`test/msgpack_ext_example_tests.erl` for example code.

```erlang
Packer = fun({ref, Ref}, Opt) when is_reference(Ref) -> {ok, {12, term_to_binary(Ref)}} end,
Unpacker = fun(12, Bin) -> {ok, {ref, binary_to_term(Bin)}} end,
Ref = make_ref(),
Opt = [{ext,{Packer,Unpacker}}],
{ok, {ref, Ref}} = msgpack:unpack(msgpack:pack({ref, Ref}, Opt), Opt).
```

This is still experimental feature, so I'm waiting for your feedback.

#### Compatibility mode

To use as same with [old spec](https://github.com/msgpack/msgpack/blob/master/spec-old.md):

```erlang
OldHam = msgpack:pack(Spam, [{enable_str,false}]),
{ok, Spam} = msgpack:unpack(OldHam, [{enable_str,false}]).
```


## Running interactively

Firstly `make all` to ensure all source files are compiled
after that you can bring the `ERL shell` with

`make run`

If you want to bring the `IEX` you can type

`make runex`