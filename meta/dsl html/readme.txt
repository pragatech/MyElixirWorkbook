markup do
    div class: "row" do
        h1 do
            text title
        end
        article do
            p do: text "Welcome!"
        end
    end
    if logged_in? do
        a href: "edit.html" do
            text "Edit"
        end
    end
end

"<div class=\"row\"><h1>Domain Specific Language</h1><article><p>Welcome!</p></article><a href=\"edit.html\">Edit</div>"