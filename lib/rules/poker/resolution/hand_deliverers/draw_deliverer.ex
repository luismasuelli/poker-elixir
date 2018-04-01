defmodule Rules.Poker.Resolution.HandDeliverers.DrawDeliverer do
  @moduledoc """
  Draw deliverers take 5 cards from the user, and deliver those 5
    cards to be computed.
  """

  alias Rules.Poker.Resolution.HandDeliverers.Base
  alias Rules.Poker.Resolution.DeliveredHands.Cards5Hand

  @behaviour Base

  def table_digest(_, _), do: nil
  def deliver(reducer_func, %{cards: {c1, c2, c3, c4, c5}}, _) do
    cards = Enum.map([c1, c2, c3, c4, c5], reducer_func)
    Cards5Hand.new(cards)
  end
end
