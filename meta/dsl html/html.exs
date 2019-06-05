defmodule Html do
    @external_resource tags_path = Path.join __DIR__, "tags.txt"

    @tags (for line <- File.stream!(tags_path, [], :line) do
        line |> String.trim |> String.to_atom
    end)

    for tag <- @tags do
        defmacro unquote(tag)(do: inner) do
            tag1 = unquote(tag)
            quote do                
                tag(unquote(tag1), do: unquote(inner))
            end
        end
    end
    defmacro markup(do: block) do
        quote do
            import Kernel, except: [div: 2]
            {:ok, var!(buffer, Html)} = start_buffer([])
            unquote(block)
            result = render(var!(buffer, Html))
            :ok = stop_buffer(var!(buffer, Html))
            #IO.puts Macro.to_string result
            result
        end
    end

    def start_buffer(state), do: Agent.start_link(fn -> state end)
    def stop_buffer(buffer), do: Agent.stop(buffer)
    def put_buffer(buffer, content), do: Agent.update(buffer, &[content | &1])
    def render(buffer), do: Agent.get(buffer, &(&1)) |> 
                            Enum.reverse |> Enum.join("")
    
    defmacro tag(name, do: inner) do
        quote do
            put_buffer var!(buffer, Html), "<#{unquote(name)}>"
            unquote(inner)
            put_buffer var!(buffer, Html), "<#{unquote(name)}/>"
        end
    end

    defmacro text(string) do
        quote do: put_buffer(var!(buffer, Html), to_string(unquote(string)))
    end
end