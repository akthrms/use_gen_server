defmodule Stack do
  use GenServer

  def start_link(stack \\ []) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(element) do
    GenServer.cast(__MODULE__, {:push, element})
  end

  @impl GenServer
  def init(stack) when is_list(stack) do
    {:ok, stack}
  end

  @impl GenServer
  def init(_stack) do
    {:error, "stack must be a list"}
  end

  @impl GenServer
  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  @impl GenServer
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl GenServer
  def handle_cast({:push, element}, stack) do
    {:noreply, [element | stack]}
  end
end
