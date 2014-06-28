defmodule TheAlchemistErl do
  @moduledoc """
  Alchemist erlang core functions
  """

	def pack(pack_data) do
		:msgpack.pack(pack_data)
	end
	
	def unpack(unpack_data) do
		:msgpack.unpack(unpack_data)
	end

	def unpack_stream(unpack_data) do
		:msgpack.unpack_stream(unpack_data)
	end

	def pack(pack_data, pack_opts) do
		:msgpack.pack(pack_data, pack_opts)
	end

	def unpack(unpack_data, unpack_opts) do
		:msgpack.unpack(unpack_data, unpack_opts)
	end

	def unpack_stream(unpack_data, unpack_opts) do
		:msgpack.unpack_stream(unpack_data, unpack_opts)
	end

	def term_to_binary(term) do
		:msgpack.term_to_binary(term)
	end
	
	def binary_to_term(binary) do
		:msgpack.binary_to_term(binary)
	end
	
	def binary_to_term(binary, safe) do
		:msgpack.binary_to_term(binary, safe)
	end

end
