defmodule Stack.Server do
    use GenServer

    def start_link(stack) do
        GenServer.start_link(__MODULE__, stack, name: __MODULE__)
    end

    def push(new_number) do
        GenServer.cast(__MODULE__, {:push, new_number})
    end

    def pop() do
        GenServer.call(__MODULE__, :pop)
    end

    #############################################
    def init(stack) do
        {:ok, stack}
    end

    def handle_cast({:push, new_number}, stack) do
        {:noreply, [new_number | stack]}
    end

    def handle_call(:pop, _from, [head | tail]) do
        {:reply, head, tail}
    end

    def terminate(reason, state) do
        IO.puts "#{inspect reason} and state #{inspect state}" 
    end
end