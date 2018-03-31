defmodule Rules.Poker.Resolution.NormalizedCard do
  @moduledoc """
  In contrast to a regular card, a normalized card has an integer value whose minimum
    may be zero, depending on the game being played and the required computations.

  The process of normalization depends on the game. Examples:
    - Regular games normalize subtracting 2 to the rank.
    - "Lo" games normalize A to 0, and other ranks subtracting 1.
"""

  require Assets.Deck.Card
  defstruct [:normalization_type, :suit, :strength]

  def normalize(:ace_high, %Assets.Deck{ranks: Assets.Deck.Card.ranks} = deck,
                           %Assets.Deck.Card{suit: suit, rank: rank}) do
    new(:ace_high, suit, rank - 2)
  end

  def normalize(:ace_low, %Assets.Deck{ranks: Assets.Deck.Card.ranks} = deck,
                          %Assets.Deck.Card{suit: suit, rank: 14}) do
    new(:ace_low, suit, 0)
  end

  def normalize(:ace_low, %Assets.Deck{ranks: Assets.Deck.Card.ranks} = deck,
                          %Assets.Deck.Card{suit: suit, rank: rank}) do
    new(:ace_low, suit, rank - 1)
  end

  defp new(type, suit, strength) do
    %__MODULE__{normalization_type: type, suit: suit, strength: strength}
  end
end
