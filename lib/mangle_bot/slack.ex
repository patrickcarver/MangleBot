defmodule MangleBot.Slack do
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
        id =  "<@#{slack.me.id}>"
        text = message.text 
                |> String.replace(id, "") 
                |> String.trim

        mangled_text = BetterMangler.run(text)
        send_message(mangled_text, message.channel, slack)
        {:ok, state}
    end

    def handle_event(_, _, state) do
        {:ok, state}
    end

    def handle_info(_, _, state) do
        {:ok, state}
    end
end