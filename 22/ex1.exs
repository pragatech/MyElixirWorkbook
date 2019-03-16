defmodule MyMacro do
    defmacro unless(condition, clauses) do
        do_clause = Keyword.get(clauses, :do, nil)
        else_clause = Keyword.get(clauses, :else, nil)
        quote do
            #do_clause = Keyword.get(clauses, :do, nil)
            #else_clause = Keyword.get(clauses, :else, nil)
            #IO.puts "testing #{unquote(do_clause)}"
            if not unquote(condition) do
                unquote(do_clause)
            else
                unquote(else_clause)
            end
        end
    end
end

defmodule Test do
    require MyMacro
    MyMacro.unless 1 != 2 do
        IO.puts true
    else
        IO.puts false
    end
end