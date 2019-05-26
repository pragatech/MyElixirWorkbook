defmodule Assertion do
    
    defmacro __using__(_opt) do
        quote do
            import unquote(__MODULE__)
            Module.register_attribute(__MODULE__, :tests, accumulate: true)
            def run do
                IO.puts "Running the tests (#inspect @tests)"
            end
        end
    end

    defmacro test(desc, do: test_block) do
        test_func = String.to_atom(desc)
        quote bind_quoted: [desc: desc, test_block: test_block, test_func: test_func] do
            @tests {test_func, desc}
            def test_func(), do: test_block
        end
    end
end