defmodule ControlFlow do
    defmacro my_if(condition, do: if_block, else: else_block) do
        quote do
            case unquote(condition) do
                result when result in [false, nil] -> unquote(else_block)
                _ -> unquote(if_block)
            end
        end
    end

    defmacro my_if(condition, do: if_block) do
        quote do
            my_if(unquote(condition), do: unquote(if_block), else: nil)
        end
    end
end