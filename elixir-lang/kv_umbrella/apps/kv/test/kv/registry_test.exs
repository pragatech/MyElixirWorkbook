defmodule KV.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    _ = start_supervised!({KV.Registry, name: :context_test})
    %{registry: :context_test}
  end

  test "spawn buckets", %{registry: registry} do
    assert  KV.Registry.lookup(registry, "shopping") == :error

    :ok = KV.Registry.create(registry, "shopping")
    assert {:ok, bucket} = KV.Registry.lookup(registry, "shopping")

    KV.Bucket.put(bucket, "milk", 1)
    assert KV.Bucket.get(bucket, "milk") == 1
  end

  test "remove buckets on exit", %{registry: registry} do
    :ok = KV.Registry.create(registry, "shopping")
    {:ok, bucket} = KV.Registry.lookup(registry, "shopping")
    Agent.stop(bucket)
    assert KV.Registry.lookup(registry, "shopping") == :error
  end
  
  test "removes bucket on crash", %{registry: registry} do
    :ok = KV.Registry.create(registry, "shopping")
    {:ok, bucket} = KV.Registry.lookup(registry, "shopping")
    Agent.stop(bucket, :shutdown)
    assert KV.Registry.lookup(registry, "shopping") == :error
  end

end
