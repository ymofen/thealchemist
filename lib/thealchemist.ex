defmodule TheAlchemist do
  @moduledoc """
  Alchemist core functions
  """

	def pack(pack_data) do
		Packer.pack(pack_data)
	end

	def pack!(pack_data) do
		Packer.pack!(pack_data)
	end
	
	def unpack(unpack_data) do
		Unpacker.unpack(unpack_data)
	end

	def unpack!(unpack_data) do
		Unpacker.unpack!(unpack_data)
	end

	def unpack_once(unpack_data) do
		Unpacker.unpack_once(unpack_data)
	end

	def unpack_once!(unpack_data) do
		Unpacker.unpack_once!(unpack_data)
	end

end
