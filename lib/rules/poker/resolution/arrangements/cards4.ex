defmodule Rules.Poker.Resolution.Arrangements.Cards4 do
  @moduledoc """
  Some games involve arrangements of 4 cards. One of them is Badugi.
  These games involve simple comparisons like card power, and no
    complex combinations beyond equal cards.
  """

  defstruct [:cards]

  def new({%Assets.Deck.Card{}, %Assets.Deck.Card{},
           %Assets.Deck.Card{}, %Assets.Deck.Card{}} = cards) do
    %__MODULE__{cards: cards}
  end
end
