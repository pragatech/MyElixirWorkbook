defmodule Stack.Stash do
    use GenServer

    def start_link(initial_value) do
        GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
    end

    def get() do
        GenServer.call(__MODULE__, :get)
    end

    def update(new_state) do
        GenServer.cast(__MODULE__, {:update, new_state})
    end
    ###################################
    def init(initial_value) do
        {:ok, [initial_value]}
    end

    def handle_call(:get, _from, current_state) do
        {:reply, current_state, current_state}
    end

    def handle_cast({:update, new_state}, _current_state) do
        {:noreply, new_state}
    end
end