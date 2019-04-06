defmodule KV.Bucket do
    use Agent, restart: :temporary

    @doc """
    start new bucket
    """
    def start_link(_initial_val) do
        Agent.start_link(fn -> %{} end)
    end

    @doc """
    Gets value from bucket
    """
    def get(bucket, key) do
        Agent.get(bucket, &Map.get(&1, key))
    end

    @doc """
    add the values to bucket
    """
    def put(bucket, key, val) do
        Agent.update(bucket, &Map.put(&1, key, val))
    end

    @doc """
    Delete the given key.
    get_and_update use
    """
    def delete(bucket, key) do
        Agent.get_and_update(bucket, &Map.pop(&1, key))
    end
end
