defmodule Rules.Poker.Resolution.PlayerHands.Cards5Hand do
  @moduledoc """
  A 5-cards hand. Examples:
  - Draw.
  """

  alias __MODULE__, H
  alias Assets.Deck.Card
  defstruct [:cards]

  def new([%Card{}, %Card{}, %Card{}, %Card{}, %Card{}] = cards) do
    %H{cards: cards}
  end
end
