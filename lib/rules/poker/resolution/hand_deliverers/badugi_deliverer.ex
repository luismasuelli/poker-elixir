defmodule Rules.Poker.Resolution.HandDeliverers.BadugiDeliverer do
  @moduledoc """
  Badugi deliverers take 4 cards from the user, and deliver those 4
    cards to be computed.
  """

  alias Rules.Poker.Resolution.HandDeliverers.Base
  alias Rules.Poker.Resolution.DeliveredHands.Cards4Hand
  alias Rules.Poker.Resolution.Reducers

  @behaviour Base

  def table_digest(_, _), do: nil
  def deliver(reducer, %{cards: {c1, c2, c3, c4}}, _) do
    cards = Enum.map([c1, c2, c3, c4], &(Reducers.reduce(reducer, &1)))
    Cards4Hand.new(cards)
  end
end
