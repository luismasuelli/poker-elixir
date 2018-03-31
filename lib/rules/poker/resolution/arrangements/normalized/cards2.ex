defmodule Rules.Poker.Resolution.Arrangements.Normalized.Cards2 do
  @moduledoc """
  Some games involve arrangements of 2 cards. One of them is Pai Gow.
  These games involve simple comparisons like card power, or at much
    finding pairs.

  A normalized arrangement involves 2 normalized cards of the same
    type of normalization.
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

  defp new({%NormalizedCard{normalization_type: ntype},
            %NormalizedCard{normalization_type: ntype}} = cards) do
    %__MODULE__{normalization_type: ntype, cards: cards}
  end
end
