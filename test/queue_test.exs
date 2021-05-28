defmodule QueueTest do
  use ExUnit.Case

  test "enqueue and dequeue" do
    Queue.start_link()
    Queue.enqueue(1)
    Queue.enqueue(2)
    Queue.enqueue(3)

    assert 1 == Queue.dequeue()
    assert 2 == Queue.dequeue()
    assert 3 == Queue.dequeue()
    assert is_nil(Queue.dequeue())
  end
end
