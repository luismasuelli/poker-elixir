defmodule Rules.Poker.Resolution.HandDeliverers.HoldemDeliverer do
  @moduledoc """
  Hold'Em deliverers take 2 cards from the user, and 5 cards from
    community. 7 cards are delivered.
  """

  alias Rules.Poker.Resolution.HandDeliverers.Base
  alias Rules.Poker.Resolution.DeliveredHands.Cards7Hand
  alias Rules.Poker.Resolution.Reducers

  @behaviour Base

  def table_digest(reducer, %{community: {c1, c2, c3, c4, c5} = cards}) do
    Enum.map([c1, c2, c3, c4, c5], &(Reducers.reduce(reducer, &1)))
  end

  def deliver(reducer, %{cards: {c1, c2}}, [c3, c4, c5, c6, c7]) do
    [c1, c2] = Enum.map([c1, c2], &(Reducers.reduce(reducer, &1)))
    Cards7Hand.new([c1, c2, c3, c4, c5, c6, c7])
  end
end
