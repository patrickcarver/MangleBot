defmodule MangleBot do
    use Slack

    alias BetterMangler
    alias MangleBot.Mangler

    def start_link(token, :whatever) do
        Slack.Bot.start_link(__MODULE__, [], token)
    end

    def handle_connect(slack, state) do
        IO.puts "Connected as #{slack.me.name}"
        {:ok, state}
    end

    def handle_event(message = %{type: "message"}, slack, state) do
        mangled_text = Mangler.get_text(message.text, slack.me.id)

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
