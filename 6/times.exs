defmodule Times do
  def double n do
    n*n
  end

  def triple n do
    n*n*n
  end

  def quadruple n do
    double(n) * double(n)
  end
end
