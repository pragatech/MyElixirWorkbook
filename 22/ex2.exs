defmodule Times do
    defmacro times_n(val) do
        fun_name = :"times_#{val}"
        IO.inspect fun_name
        quote do
            def unquote(fun_name)(x) do
               unquote(val)*x 
            end
        end
    end
end
defmodule Test do
    require Times
    Times.times_n(3)
    Times.times_n(4)
end