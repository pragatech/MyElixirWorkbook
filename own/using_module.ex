defmodule UsingModule do
    require PrivateModule

    def call() do
        IO.puts "Using module"
    end
end