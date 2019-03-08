defmodule Scheduler do
    def run(num_process, module, func, to_calculate) do
        1..num_process
        |> Enum.map(fn (_) -> spawn(module, func, [self()]) end)
        |> schedule_process(to_calculate, [])
    end

    def schedule_process(processes, queue, results) do
        receive do        
            {:ready, pid} when queue != [] ->
                [next | tail] = queue
                send pid, {:fib, next, self()}
                schedule_process(processes, tail, results)
            {:ready, pid} ->
                send pid, {:shutdown}
                if length(processes) > 1 do
                    schedule_process(List.delete(processes, pid), queue, results)
                else
                    Enum.sort(results, fn({n1,_}, {n2,_}) -> n1 <= n2 end)
                end
            {:answer, number, result, _pid} ->
                schedule_process(processes, queue, [{number, result} | results])
        end        
    end
end