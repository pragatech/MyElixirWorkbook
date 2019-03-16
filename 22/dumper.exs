defmodule My do
    defmacro macro(param) do
        IO.inspect param
    end
end

defmodule Test do
    require My

    My.macro :atom
    My.macro 1
    My.macro 1.0
    My.macro [1,2,3]
    My.macro { 2,3 }
    My.macro [do: 1, else: 1]

    My.macro { 2,3,5 }
    My.macro { 1,2,3,4,5 }
    My.macro do: ( a = 1; a+a )

    My.macro do
        1+2
    else
        3+4
    end
end