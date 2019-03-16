defmodule My do
    defmacro macro(code) do
        quote do: IO.puts "Different Code"     
    end
end

defmodule Test do
    require My
    My.macro IO.puts "Praga"
end
