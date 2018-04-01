defmodule Rules.Poker.Resolution.PlayerHands.Cards6Hand do
  @moduledoc """
  A 6-cards hand. Examples:
  - Stud (when exactly 8 players are active when the
      showdown occurs).
  """

  alias __MODULE__, H
  alias Assets.Deck.Card
  defstruct [:cards]

  def new([%Card{}, %Card{}, %Card{}, %Card{}, %Card{}, %Card{}] = cards) do
    %H{cards: cards}
  end
end
