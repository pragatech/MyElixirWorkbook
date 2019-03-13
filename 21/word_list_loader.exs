defmodule WordListLoader do
    def load_from_files(file_names) do
        file_names
        |> Stream.map(fn name -> Task.async(fn -> load_task(name) end) end)
        |> Enum.map(&Task.await/1)
    end

    defp load_task(name) do
        File.stream!(name, [], :line)
        |> Enum.map(&String.trim/1)
        |> Dictionary.add_words()
    end
end