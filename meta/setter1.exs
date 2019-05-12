defmodule Setter do
    defmacro bind_name(string) do
        quote do 
            require Integer
            name = unquote(string)
        end
    end
end