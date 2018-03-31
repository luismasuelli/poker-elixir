defmodule Rules.Poker.Resolution.Arrangements.Normalized.Cards4 do
  @moduledoc """
  Some games involve arrangements of 4 cards. One of them is Badugi.
  These games involve simple comparisons like card power, and no
    complex combinations beyond equal cards.

  A normalized arrangement involves 4 normalized cards of the same
    type of normalization.

  Notes: Currently supported normalization types hold for full-rank
    decks only.
  """

  alias Assets.Deck
  alias Assets.Deck.Card
  alias Rules.Poker.Resolution.NormalizedCard
  alias Rules.Poker.Resolution.Arrangements.Cards4

  defstruct [:normalization_type, :cards]

  def normalize(%Deck{} = deck, normalization_type,
                %Cards4{cards: {
                  %Card{} = card1, %Card{} = card2,
                  %Card{} = card3, %Card{} = card4
                }}) do
    new({
      NormalizedCard.normalize(normalization_type, deck, card1),
      NormalizedCard.normalize(normalization_type, deck, card2),
      NormalizedCard.normalize(normalization_type, deck, card3),
      NormalizedCard.normalize(normalization_type, deck, card4)
    })
  end

  defp new({%NormalizedCard{normalization_type: ntype},
            %NormalizedCard{normalization_type: ntype},
            %NormalizedCard{normalization_type: ntype},
            %NormalizedCard{normalization_type: ntype}} = cards) do
    %__MODULE__{normalization_type: ntype, cards: cards}
  end
end
