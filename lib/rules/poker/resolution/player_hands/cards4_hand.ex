defmodule Rules.Poker.Resolution.PlayerHands.Cards4Hand do
  @moduledoc """
  A 4-cards hand. Examples:
  - Omaha.
  - Badugi.
  """

  alias __MODULE__, H
  alias Assets.Deck.Card
  defstruct [:cards]

  def new([%Card{}, %Card{}, %Card{}, %Card{}] = cards) do
    %H{cards: cards}
  end
end
