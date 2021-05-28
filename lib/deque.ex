defmodule Deque do
  use GenServer

  def start_link(deque \\ []) do
    GenServer.start_link(__MODULE__, deque, name: __MODULE__)
  end

  def push_front(element) do
    GenServer.cast(__MODULE__, {:push_front, element})
  end

  def push_back(element) do
    GenServer.cast(__MODULE__, {:push_back, element})
  end

  def pop_front do
    GenServer.call(__MODULE__, :pop_front)
  end

  def pop_back do
    GenServer.call(__MODULE__, :pop_back)
  end

  def init(deque) when is_list(deque) do
    {:ok, deque}
  end

  def init(_deque) do
    {:error, "deque must be a list"}
  end

  def handle_cast({:push_front, element}, deque) do
    {:noreply, [element | deque]}
  end

  def handle_cast({:push_back, element}, deque) do
    {:noreply, deque ++ [element]}
  end

  def handle_call(:pop_front, _from, []) do
    {:reply, nil, []}
  end

  def handle_call(:pop_front, _from, [element | deque]) do
    {:reply, element, deque}
  end

  def handle_call(:pop_back, _from, []) do
    {:reply, nil, []}
  end

  def handle_call(:pop_back, _from, deque) do
    {element, new_deque} = List.pop_at(deque, -1)
    {:reply, element, new_deque}
  end
end
