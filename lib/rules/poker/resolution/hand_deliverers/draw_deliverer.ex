defmodule Rules.Poker.Resolution.HandDeliverers.DrawDeliverer do
  @moduledoc """
  Draw deliverers take 5 cards from the user, and deliver those 5
    cards to be computed.
  """

  alias Rules.Poker.Resolution.HandDeliverers.Base
  alias Rules.Poker.Resolution.DeliveredHands.Cards5Hand
  alias Rules.Poker.Resolution.Reducers

  @behaviour Base

  def table_digest(_, _), do: nil
  def deliver(reducer, %{cards: {c1, c2, c3, c4, c5}}, _) do
    cards = Enum.map([c1, c2, c3, c4, c5], &(Reducers.reduce(reducer, &1)))
    Cards5Hand.new(cards)
  end
end
