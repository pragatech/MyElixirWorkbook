defmodule Parser do
    @callback parse(String.t) :: {:ok. term} | {:error, String.t}
    @callback extensions() :: [String.t]

    def parse!(implementation, contents) do
        case implementation.parse(contents) do
            {:ok, data} -> data
            {:error, error} -> raise ArgumentError, "parsing error: #{error}"                
        end
    end
end