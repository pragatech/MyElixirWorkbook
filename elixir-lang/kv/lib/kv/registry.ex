defmodule KV.Registry do
  use GenServer

  ##Client API
  def start_link(opts) do
    server = Keyword.fetch!(opts, :name)
    GenServer.start_link(__MODULE__, server, opts)
  end

  def lookup(server, name) do
    case :ets.lookup(server, name) do
      [{^name, pid}] -> {:ok, pid}
      _ -> :error
    end
  end

  def create(server, name) do
    GenServer.call(server, {:create, name})
  end

  def stop(server) do
    GenServer.stop(server)
  end
  ##Server API
  def init(table) do
    names = :ets.new(table, [:named_table, read_concurrency: true])
    refs = %{}  
    {:ok, {names, refs}}
  end

  def handle_call({:create, name}, _from, {names, refs}) do
    case lookup(names, name) do
      [:ok, _pid] ->
          {:reply, :ok, {names, refs}}
      :error ->
          {:ok, bucket} = DynamicSupervisor.start_child(KV.BucketSupervisor, KV.Bucket)
          ref = Process.monitor(bucket)
          refs = Map.put(refs, ref, name)
          :ets.insert(names, {name, bucket})
          {:reply, :ok, {names, refs}}
    end
  end

  def handle_info({:DOWN, ref, :process, _pid, _reason}, {names, refs}) do
      {name, refs} = Map.pop(refs, ref)
      :ets.delete(names, name)
      {:noreply, {names, refs}}
  end

  def handle_info(_msg, state) do
    {:noreply, state}
  end
end
