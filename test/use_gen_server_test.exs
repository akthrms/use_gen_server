defmodule UseGenServerTest do
  use ExUnit.Case
  doctest UseGenServer

  test "greets the world" do
    assert UseGenServer.hello() == :world
  end
end
