defmodule ControlFlow do
    defmacro unless(condition, do: block) do
        quote do
            case !unquote(condition) do
                x when x in[false, nil] -> nil
                _                       -> unquote(block)
            end
        end
    end

    defmacro unless(_condition, _block) do
        quote do 
            raise ArgumentError, ~S(invalid or duplicate keys for unless, only "do" and an optional "else" are permitted)
        end
    end
end