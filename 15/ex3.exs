### Ex 3,4,5.... 
defmodule Ex3 do
    import :timer
    def child(sender) do
        send sender, {:ok, :to_me1}
        send sender, {:ok, :to_me2}
        send sender, {:ok, :to_me3}
        #exit(:boom)  --- abnormal exit
    end

    def run do
        #Process.flag(:trap_exit, false)
        spawn_link(Ex3, :child, [self()])
        #spawn_monitor(Ex3, :child, [self()])
        sleep(500)
        read()
    end

    defp read do
        receive do
            {:ok, msg} ->
                IO.puts msg
                read()
            msg ->
                IO.puts inspect msg
                read()
            after 1000 ->
                IO.puts "Nothing happened"    
        end
    end
end