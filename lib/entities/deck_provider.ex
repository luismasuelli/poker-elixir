defmodule Entities.DeckProvider do
  @moduledoc false

  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, %{}, opts)
  end

  def init(_) do
    {:ok, %{}}
  end

  def handle_call({:inspect, key}, _from, state) do
    {:reply, Map.fetch(state, key), state}
  end

  def handle_call({:inspect!, key}, _from, state) do
    {:reply, Map.fetch!(state, key), state}
  end

  def handle_call({:get, key}, _from, state) do
    deck = case Map.fetch(state, key) do
      {:ok, fetched} -> Assets.Deck.shuffle(fetched)
      :error -> nil
    end
    {:reply, deck, state}
  end

  def handle_call({:get!, key}, _from, state) do
    {:reply, Assets.Deck.shuffle(Map.fetch!(state, key)), state}
  end

  def handle_call({:put, key, args}, _from, state) do
    state = Map.put(state, key, Kernel.apply(Assets.Deck, :new, args))
    {:reply, :ok, state}
  end

  def handle_cast(_, state) do
    {:noreply, state}
  end
end