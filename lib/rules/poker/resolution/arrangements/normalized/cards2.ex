defmodule Rules.Poker.Resolution.Arrangements.Normalized.Cards2 do
  @moduledoc """
  Some games involve arrangements of 2 cards. One of them is Pai Gow.
  These games involve simple comparisons like card power, or at much
    finding pairs.

  Cards will be sorted descendingly acording to rank.

  A normalized arrangement involves 2 normalized cards of the same
    type of normalization.

  Notes: Currently supported normalization types hold for full-rank
    decks only.
  """

  alias Assets.Deck
  alias Assets.Deck.Card
  alias Rules.Poker.Resolution.NormalizedCard
  alias Rules.Poker.Resolution.Arrangements.Cards2

  defstruct [:normalization_type, :cards]

  def normalize(%Deck{} = deck, normalization_type,
                %Cards2{cards: {
                  %Card{} = card1, %Card{} = card2
                }}) do
    new({
      NormalizedCard.normalize(normalization_type, deck, card1),
      NormalizedCard.normalize(normalization_type, deck, card2)
    })
  end

  defp new({%NormalizedCard{normalization_type: ntype} = card1,
            %NormalizedCard{normalization_type: ntype} = card2}) do
    %__MODULE__{normalization_type: ntype, cards: sort(card1, card2)}
  end

  defp sort(%NormalizedCard{strength: s1} = card1,
            %NormalizedCard{strength: s2} = card2) when s2 > s1 do
    {card2, card1}
  end

  defp sort(%NormalizedCard{strength: s1} = card1,
            %NormalizedCard{strength: s2} = card2)do
    {card1, card2}
  end
end
