defmodule Assets.Deck.Card do
  @moduledoc false

  defstruct [:rank, :suit]

  defmacro suits do
    quote do
      [:clubs, :diamonds, :hearts, :spades]
    end
  end

  defmacro ranks do
    quote do
      [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    end
  end

  defmacro text_rank(rank) do
    quote do
      elem({2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"}, unquote(rank) - 2)
    end
  end

  defguard is_suit(suit) when suit in suits
  defguard is_rank(rank) when rank >= 2 and rank <= 14

  def new(rank, suit) when rank >= 2 and rank <= 14 and is_suit(suit) do
    %__MODULE__{rank: rank, suit: suit}
  end

  def new(:wildcard) do
    %__MODULE__{rank: nil, suit: nil}
  end
end

defimpl String.Chars, for: Assets.Deck.Card do
  require Assets.Deck.Card

  def to_string(%Assets.Deck.Card{rank: nil, suit: nil}) do
    "wildcard"
  end

  def to_string(%Assets.Deck.Card{rank: rank, suit: suit}) do
    "#{Assets.Deck.Card.text_rank(rank)} of #{suit}"
  end
end