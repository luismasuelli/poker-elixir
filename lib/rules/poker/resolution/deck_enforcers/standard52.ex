defmodule Rules.Poker.Resolution.DeckEnforcers.Standard52 do
  @moduledoc """
  Enforces the deck format to be a standard deck: 13 ranks,
    4 suits, 1 copy, and no wildcards.
  """

  alias Rules.Poker.Resolution.DeckEnforcers.Base
  alias Assets.Deck
  alias Assets.Deck.Card

  @behaviour Base

  def deck_allowed(%Deck{ranks: Card.ranks, suits: Card.suits, wildcards: 0, copies: 1}) do
    true
  end

  def deck_allowed(_) do
    false
  end
end
