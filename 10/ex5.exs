defmodule MyList do
    
    defp _each([], _fun), do: :ok
    
    defp _each([h|t], fun) do
        fun.(h)
        _each(t, fun)
    end

    def each(list, fun) when is_list(list) and is_function(fun) do
        _each list, fun    
    end

    defp _all?([], _, val), do: val
    
    defp _all?(_, _, false) do
        false
    end
    
    defp _all?([h|t], fun, true) do
        _all?(t, fun, fun.(h))
    end

    def all?(list, fun \\ fn x -> x end) when is_list(list) do
        _all? list, fun, true
    end

    defp _filter([],l,_), do: Enum.reverse(l)

    defp _filter([h|t], l, fun) do
        if(fun.(h)) do
           l = [h | l]     
           _filter(t, l, fun)
        else
           _filter(t, l, fun) 
        end
    end

    def filter list, fun do
        _filter list, [], fun
    end

    defp _take([], l, _), do: Enum.reverse(l)

    defp _take(_, l, 0), do: Enum.reverse(l)

    defp _take([h|t], l, amt) do
        l = [h | l]
        _take(t, l, amt-1)
    end

    def take(list, amt) do
        _take(list, [], amt)
    end
end 