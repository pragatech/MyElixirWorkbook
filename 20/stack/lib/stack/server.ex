defmodule Stack.Server do
    use GenServer, restart: :transient

    def start_link(_stack) do
        GenServer.start_link(__MODULE__, nil, name: __MODULE__)
    end

    def push(new_number) do
        GenServer.cast(__MODULE__, {:push, new_number})
    end

    def pop() do
        GenServer.call(__MODULE__, :pop)
    end

    #############################################
    def init(stack) do
        {:ok, Stack.Stash.get()}
    end

    def handle_cast({:push, new_number}, stack) do
        {:noreply, [new_number | stack]}
    end

    def handle_call(:pop, _from, [head | tail]) do
        {:reply, head, tail}
    end

    def terminate(_reason, state) do
        Stack.Stash.update state
    end
end