defmodule Queue do
  use GenServer

  def start_link(queue \\ []) do
    GenServer.start_link(__MODULE__, queue, name: __MODULE__)
  end

  def dequeue do
    GenServer.call(__MODULE__, :dequeue)
  end

  def enqueue(element) do
    GenServer.cast(__MODULE__, {:enqueue, element})
  end

  @impl GenServer
  def init(queue) when is_list(queue) do
    {:ok, queue}
  end

  @impl GenServer
  def init(_queue) do
    {:error, "queue must be a list"}
  end

  @impl GenServer
  def handle_call(:dequeue, _from, []) do
    {:reply, nil, []}
  end

  @impl GenServer
  def handle_call(:dequeue, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl GenServer
  def handle_cast({:enqueue, element}, queue) do
    {:noreply, queue ++ [element]}
  end
end
