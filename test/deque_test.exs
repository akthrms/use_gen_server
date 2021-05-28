defmodule DequeTest do
  use ExUnit.Case

  test "push_front and pop_back" do
    Deque.start_link()
    Deque.push_front(1)
    Deque.push_front(2)
    Deque.push_front(3)

    assert 1 == Deque.pop_back()
    assert 2 == Deque.pop_back()
    assert 3 == Deque.pop_back()
    assert is_nil(Deque.pop_back())
  end

  test "push_back and pop_front" do
    Deque.start_link()
    Deque.push_back(1)
    Deque.push_back(2)
    Deque.push_back(3)

    assert 1 == Deque.pop_front()
    assert 2 == Deque.pop_front()
    assert 3 == Deque.pop_front()
    assert is_nil(Deque.pop_front())
  end
end
