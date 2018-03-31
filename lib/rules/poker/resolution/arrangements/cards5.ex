defmodule Rules.Poker.Resolution.Arrangements.Cards5 do
  @moduledoc """
  Regular poker games involve arrangements of 5 cards.
  Arrangements of 5 cards are used to calculate complex stuff like
    flush, straights, full houses, ...
  """

  defstruct [:cards]

  def new({%Assets.Deck.Card{}, %Assets.Deck.Card{},
           %Assets.Deck.Card{}, %Assets.Deck.Card{},
           %Assets.Deck.Card{}} = cards) do
    %__MODULE__{cards: cards}
  end
end
