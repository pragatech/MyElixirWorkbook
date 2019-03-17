defmodule My do
    defmacro mydef(name) do
        quote bind_quoted: [name1: name] do
            def unquote(name1)(), do: unquote(name1)
        end
    end
end
defmodule Test do
    require My
    [:fred , :bret] |> Enum.each(&My.mydef(&1))
end