defmodule StackTest do
  use ExUnit.Case

  test "push and pop" do
    Stack.start_link()
    Stack.push(1)
    Stack.push(2)
    Stack.push(3)

    assert 3 == Stack.pop()
    assert 2 == Stack.pop()
    assert 1 == Stack.pop()
    assert is_nil(Stack.pop())
  end
end
