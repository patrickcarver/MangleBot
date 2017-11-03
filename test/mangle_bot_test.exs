defmodule MangleBotTest do
  use ExUnit.Case
  doctest MangleBot

  test "greets the world" do
    assert MangleBot.hello() == :world
  end
end
