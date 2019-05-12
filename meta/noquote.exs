defmodule NoQuote do
    defmacro sub({:+, metadata, args}) do
        {:-, metadata, args}
    end
end