defmodule Math do
  def sum n do
    sum n,0
  end

  def sum 0,0 do
    0
  end

  def sum 1,acc do
    acc+1
  end

  def sum n,acc do
    acc = acc + n
    n = n-1
    sum n, acc
  end
end
