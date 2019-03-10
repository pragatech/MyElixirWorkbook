defmodule Sequence.Stash do
    use GenServer

    def start_link(new_number) do
        GenServer.start_link(__MODULE__, new_number, name: __MODULE__)
    end

    def get() do
        GenServer.call(__MODULE__, :get)
    end

    def update(new_number) do
        GenServer.cast(__MODULE__, {:update, new_number})        
    end

    #########################################
    def init(args) do
        {:ok, args}
    end

    def handle_call(:get, _from, current_number) do
        {:reply, current_number, current_number}
    end

    def handle_cast({:update, new_number}, _current_number) do
        {:noreply, new_number}
    end
end