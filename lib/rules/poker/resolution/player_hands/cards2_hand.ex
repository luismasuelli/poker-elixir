defmodule Rules.Poker.Resolution.PlayerHands.Cards2Hand do
  @moduledoc """
  A 2-cards hand. Examples:
  - Hold'Em.
  - Pai Gow front hand.
  """

  alias __MODULE__, H
  alias Assets.Deck.Card
  defstruct [:cards]

  def new([%Card{}, %Card{}] = cards) do
    %H{cards: cards}
  end
end
