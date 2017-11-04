defmodule MangleBot.Mangler do
    alias BetterMangler

    def get_text(message_text, id) do
        message_text 
        |> remove_bot_id_from_message(id)
        |> BetterMangler.run        
    end

    defp remove_bot_id_from_message(text, id) do
      tag = "<@#{id}>"
      
      text 
        |> String.replace(tag, "") 
        |> String.trim
    end    
end