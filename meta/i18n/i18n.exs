defmodule I18n do
    use Translator

    locale "en",
        flash: [
            hello: "Hello %{first} %{last}!",
            bye: "Bye, %{name}!"
        ],
        users: [
            title: "Users"
        ]
    
    locale "fr",
        flash: [
            hello: "Sault %{first} %{last}!",
            bye: "Au revoir, %{name}!"
        ],
        users: [
            title: "Users"
        ]
end