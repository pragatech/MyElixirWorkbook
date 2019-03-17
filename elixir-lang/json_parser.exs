defmodule JsonParser do
    @behaviour Parser

    @impl Parser
    def parse(str) do
        {:ok, "some Json " <> str}
    end

    @impl Parser
    def extensions() do
        [:json]
    end
end