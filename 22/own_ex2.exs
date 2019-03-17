defmodule Times do
    defmacro times_n(val) do
        quote bind_quoted: [a: val] do
            IO.inspect a
            def unquote(elem(a,1))(x), do: unquote(elem(a, 0))*x 
        end
    end
end
defmodule Test do
    require Times
    [3,4] 
    |> Enum.map(&({&1,:"times_#{&1}"}))
    |> Enum.each(&Times.times_n(&1))
end