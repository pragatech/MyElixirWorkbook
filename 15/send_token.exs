defmodule SendToken do
    def send_token() do
        receive do
            {sender, value} ->
                send sender, {:ok, value}
                send_token()
        end
    end

    def run do
        pid1 = spawn(SendToken, :send_token, [])
        pid2 = spawn(SendToken, :send_token, [])

        send pid1, {self(), "Mr. Bing"}
        send pid2, {self(), "Mr. Praga"}
        
        read()
        read()
    end

    defp read do
        receive do
            {:ok, value} ->
                IO.puts value
        end
    end

end