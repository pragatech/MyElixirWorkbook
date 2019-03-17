defprotocol Size do
  @doc """
  Calculates the size
  """
  def size(data)
end

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end