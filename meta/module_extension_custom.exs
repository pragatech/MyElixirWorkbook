defmodule Assertion do
    defmacro __using__(_opt) do
        quote do
            import unquote(__MODULE__)
            def run do
                IO.puts "#{__MODULE__} Running the tests..."
            end
        end
    end
end

defmodule MathTest do
    use Assertion
end