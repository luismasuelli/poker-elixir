defmodule Rules.Poker.Resolution.PlayerHands.Cards7Hand do
  @moduledoc """
  A 7-cards hand. Examples:
  - Stud (when less than 8 players are active when the
      showdown occurs).
  """

  alias __MODULE__, H
  alias Assets.Deck.Card
  defstruct [:cards]

  def new([%Card{}, %Card{}, %Card{}, %Card{}, %Card{}, %Card{}, %Card{}] = cards) do
    %H{cards: cards}
  end
end
