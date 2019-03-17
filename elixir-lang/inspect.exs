(1..10)
|> IO.inspect
|> Enum.map(fn x -> x*2 end)
|> IO.inspect
|> Enum.sum
|> IO.inspect

[1,2,3]
|> IO.inspect(label: "before")
|> Enum.map(&(&1*2))
|> IO.inspect(label: "after")
|> Enum.sum

defmodule My do
    def some_fun(a, b, c) do
        require IEX; IEx.pry()
        IO.inspect binding()
    end        
end

My.some_fun(:foo, "bar", :baz)