defmodule Rules.Poker.Resolution.NormalizedCard do
  @moduledoc """
  In contrast to a regular card, a normalized card has an integer value whose minimum
    may be zero, depending on the game being played and the required computations.

  The process of normalization depends on the game. Examples:
    - :ace_high: Regular games normalize subtracting 2 to the rank.
    - :ace_low: "Lo" games normalize A to 0, and other ranks subtracting 1.
    Both cases need to consider the whole rank (including, or not, wildcards).
  """

  require Assets.Deck.Card
  alias Assets.Deck
  alias Assets.Deck.Card

  defstruct [:normalization_type, :suit, :strength]

  def normalize(:ace_high, %Deck{ranks: Card.ranks},
                           %Card{suit: suit, rank: rank}) do
    new(:ace_high, suit, rank - 2)
  end

  def normalize(:ace_low, %Deck{ranks: Card.ranks},
                          %Card{suit: suit, rank: 14}) do
    new(:ace_low, suit, 0)
  end

  def normalize(:ace_low, %Deck{ranks: Card.ranks},
                          %Card{suit: suit, rank: rank}) do
    new(:ace_low, suit, rank - 1)
  end

  defp new(type, suit, strength) do
    %__MODULE__{normalization_type: type, suit: suit, strength: strength}
  end
end
