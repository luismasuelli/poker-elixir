defmodule Rules.Poker.Resolution.Scores.Standard52DistinctUtils do
  @moduledoc """
  Comparing like this is somewhat different.

  First, a better hand will count by the amount of cards.
  Then, what will count is the values of the cards.

  For the comparison to work, we will take the cards and:
  - Sort ascendingly.
  - Negate them (so the comparison works for lower, as we intend).
  """

  alias Rules.Poker.Resolution.Scores.Result

  def distinct(rank1) do
    Result.new 0, [-rank1], :badugi1
  end

  def distinct(rank1, rank2) do
    [rank1, rank2] = Enum.sort([-rank1, -rank2])
    Result.new 0, {rank1, rank2}, :badugi2
  end

  def distinct(rank1, rank2, rank3) do
    [rank1, rank2, rank3] = Enum.sort([-rank1, -rank2, -rank3])
    Result.new 0, {rank1, rank2, rank3}, :badugi3
  end

  def distinct(rank1, rank2, rank3, rank4) do
    [rank1, rank2, rank3, rank4] = Enum.sort([-rank1, -rank2, -rank3, -rank4])
    Result.new 0, {rank1, rank2, rank3, rank4}, :badugi4
  end
end
