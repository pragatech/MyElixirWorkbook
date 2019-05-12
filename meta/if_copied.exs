defmodule ControlFlow do
    defmacro my_if(expr, clauses) do
        build_if(expr, clauses)
    end

    defp build_if(expr, do: do_clause) do
        build_if(expr, do: do_clause, else: nil)    
    end

    defp build_if(expr, do: do_clause, else: else_clause) do
        quote do    
            case unquote expr do
                result when result in [false, nil] -> unquote(else_clause)
                _ ->  unquote(do_clause)  
            end
        end
    end
end