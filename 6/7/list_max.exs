defmodule MyList do
  def find_max(list) when is_list(list) do
    _max 0, list
  end

  defp _max max, [] do
    max
  end

  defp _max max, [head|tail] when max < head do
    _max head, tail
  end

  defp _max max, [head|tail] when max >= head do
    _max max, tail
  end
end
