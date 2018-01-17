defmodule CodeAdventTest do
  use ExUnit.Case
  doctest CodeAdvent

  test "greets the world" do
    assert CodeAdvent.hello() == :world
  end
end
