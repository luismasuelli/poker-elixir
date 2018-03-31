defmodule Rules.Poker.Resolution.Arrangements.Cards2 do
  @moduledoc """
  Some games involve arrangements of 2 cards. One of them is Pai Gow.
  These games involve simple comparisons like card power, or at much
    finding pairs.
  """

  defstruct [:cards]

  def new({%Assets.Deck.Card{}, %Assets.Deck.Card{}} = cards) do
    %__MODULE__{cards: cards}
  end
end
