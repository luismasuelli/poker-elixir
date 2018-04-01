defmodule Rules.Poker.Resolution.Reducers do
  @moduledoc """
  Executes the reduction of a card's rank.

  Suit is respected.

  A new map is created with the suit and the
    reduced rank.
  """

  alias Assets.Deck.Card

  def reduce(module, %Card{suit: suit, rank: rank}) do
    %{suit: suit, rank: module.reduce(rank)}
  end
end
