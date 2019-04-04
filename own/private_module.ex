defmodule PrivateModule do
    
    def call() do
        IO.puts "Private Module"
    end

    defp test() do
        IO.puts "test private function"
    end
end