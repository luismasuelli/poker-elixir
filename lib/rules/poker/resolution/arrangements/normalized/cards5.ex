defmodule Rules.Poker.Resolution.Arrangements.Normalized.Cards5 do
  @moduledoc """
  Regular poker games involve arrangements of 5 cards.
  Arrangements of 5 cards are used to calculate complex stuff like
    flush, straights, full houses, ...

  Cards will be sorted descendingly acording to rank.

  A normalized arrangement involves 5 normalized cards of the same
    type of normalization.

  Notes: Currently supported normalization types hold for full-rank
    decks only.
  """

  alias Assets.Deck
  alias Assets.Deck.Card
  alias Rules.Poker.Resolution.NormalizedCard
  alias Rules.Poker.Resolution.Arrangements.Cards5

  defstruct [:normalization_type, :cards]

  def normalize(%Deck{} = deck, normalization_type,
                %Cards5{cards: {
                  %Card{} = card1, %Card{} = card2,
                  %Card{} = card3, %Card{} = card4,
                  %Card{} = card5
                }}) do
    new([
      NormalizedCard.normalize(normalization_type, deck, card1),
      NormalizedCard.normalize(normalization_type, deck, card2),
      NormalizedCard.normalize(normalization_type, deck, card3),
      NormalizedCard.normalize(normalization_type, deck, card4),
      NormalizedCard.normalize(normalization_type, deck, card5)
    ])
  end

  defp new([%NormalizedCard{normalization_type: ntype},
            %NormalizedCard{normalization_type: ntype},
            %NormalizedCard{normalization_type: ntype},
            %NormalizedCard{normalization_type: ntype},
            %NormalizedCard{normalization_type: ntype}] = cards) do
    %__MODULE__{normalization_type: ntype, cards: sort(cards)}
  end

  defp sort(cards) do
    [card1, card2, card3, card4, card5] = cards |> Enum.sort_by(&(-&1.strength))
    {card1, card2, card3, card4, card5}
  end
end
