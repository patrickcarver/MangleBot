defmodule MangleBot do
    use Slack

    alias BetterMangler

    def start_link(token, :whatever) do
        Slack.Bot.start_link(__MODULE__, [], token)
    end

    def handle_connect(slack, state) do
        IO.puts "Connected as #{slack.me.name}"
        {:ok, state}
    end

    def handle_event(message = %{type: "message"}, slack, state) do
        mangled_text = message.text 
                        |> remove_bot_id_from_message(slack.me.id)
                        |> BetterMangler.run

        send_message(mangled_text, message.channel, slack)
        
        {:ok, state}
    end

    def handle_event(_, _, state) do
        {:ok, state}
    end

    def handle_info(_, _, state) do
        {:ok, state}
    end

    defp remove_bot_id_from_message(text, id) do
      tag = "<@#{id}>"
      
      text 
        |> String.replace(tag, "") 
        |> String.trim
    end
end
