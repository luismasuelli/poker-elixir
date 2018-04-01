defmodule Rules.Poker.Resolution.HandDeliverers.OmahaDeliverer do
  @moduledoc """
  Hold'Em deliverers take 4 cards from the user, and 5 cards from
    community. The whole set 4/5 is delivered.
  """

  alias Rules.Poker.Resolution.HandDeliverers.Base
  alias Rules.Poker.Resolution.DeliveredHands.Cards45Hand

  @behaviour Base

  def table_digest(reducer_func, %{community: {c1, c2, c3, c4, c5} = cards}) do
    Enum.map([c1, c2, c3, c4, c5], reducer_func)
  end

  def deliver(reducer_func, %{cards: {c1, c2, c3, c4}}, [c5, c6, c7, c8, c9] = cards5) do
    [c1, c2, c3, c4] = Enum.map([c1, c2, c3, c4], reducer_func)
    Cards45Hand.new([c1, c2, c3, c4], cards5)
  end
end
