defmodule ParallelMap do
    def pmap(collection, fun) do
        me = self()
        collection
        |> Enum.map(fn elem -> 
            spawn fn -> send(me, {self(), fun.(elem)}) end end)
        |> Enum.map(fn(pid) -> 
                        receive do 
                            {^pid, elem} -> elem
                        end
                    end)
    end
end