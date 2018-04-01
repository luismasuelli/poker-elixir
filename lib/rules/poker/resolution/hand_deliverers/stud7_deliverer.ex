defmodule Rules.Poker.Resolution.HandDeliverers.Stud7Deliverer do
  @moduledoc """
  7 Cards Stud deliverers take 7 cards from the user, or 6 cards
    from the user and 1 from community if 8 players reach the
    showdown.
  """

  alias Rules.Poker.Resolution.HandDeliverers.Base
  alias Rules.Poker.Resolution.DeliveredHands.Cards7Hand
  alias Rules.Poker.Resolution.Reducers

  @behaviour Base

  def table_digest(reducer, %{community: nil}) do
    nil
  end

  def table_digest(reducer, %{community: c1}) do
    Reducers.reduce(reducer, &1)
  end

  def deliver(reducer, %{cards: {c1, c2, c3, c4, c5, c6, c7}}, nil) do
    [c1, c2, c3, c4, c5, c6, c7] = Enum.map([c1, c2, c3, c4, c5, c6, c7], &(Reducers.reduce(reducer, &1)))
    Cards7Hand.new([c1, c2, c3, c4, c5, c6, c7])
  end

  def deliver(reducer, %{cards: {c1, c2, c3, c4, c5, c6, nil}}, c7) do
    [c1, c2, c3, c4, c5, c6] = Enum.map([c1, c2, c3, c4, c5, c6], &(Reducers.reduce(reducer, &1)))
    Cards7Hand.new([c1, c2, c3, c4, c5, c6, c7])
  end
end
