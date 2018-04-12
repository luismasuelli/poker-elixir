defmodule Rules.Poker.Mechanics.DeckPickers do
  @moduledoc """
  Given a module and a pid, it will install or generate the appropriate decks
    for the appropriate game.
  """

  def install(module, pid) do
    GenServer.call(pid, {:put, module.deck_name, module.deck_spec})
  end

  def pick(module, pid) do
    GenServer.call(pid, {:get!, module.deck_name})
  end

  def check(module, pid) do
    GenServer.call(pid, {:inspect!, module.deck_name})
  end
end
