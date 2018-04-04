defmodule Rules.Poker.Resolution.Scores.Standard52CompleteUtils do
  @moduledoc """
  Generation utils for appropriately comparable standard poker hands.
  Usually these belong to standard decks (52 cards) but that is not
    enforced here anyhow.
  """

  alias Rules.Poker.Resolution.Scores.Result

  @bust 0
  @pair 1
  @double_pair 2
  @three_oak 3
  @straight 4
  @flush 5
  @full_house 6
  @four_oak 7
  @straight_flush 8

  def bust(r1, r2, r3, r4, r5) do
    [r1, r2, r3, r4, r5] = Enum.sort_by([r1, r2, r3, r4, r5], &(-&1))
    Result.new(@bust, {r1, r2, r3, r4, r5}, :bust)
  end

  def pair(rank, k1, k2, k3) do
    [k1, k2, k3] = Enum.sort_by([k1, k2, k3], &(-&1))
    Result.new(@pair, {rank, k1, k2, k3}, :pair)
  end

  def double_pair(rank1, rank2, k) do
    [rank1, rank2] = Enum.sort_by([rank1, rank2], &(-&1))
    Result.new(@double_pair, {rank1, rank2, k}, :double_pair)
  end

  def three_oak(rank, k1, k2) do
    [k1, k2] = Enum.sort_by([k1, k2], &(-&1))
    Result.new(@three_oak, {rank, k1, k2}, :three_oak)
  end

  def straight(rank) do
    Result.new(@straight, {rank}, :straight)
  end

  def flush(r1, r2, r3, r4, r5) do
    [r1, r2, r3, r4, r5] = Enum.sort_by([r1, r2, r3, r4, r5], &(-&1))
    Result.new(@flush, {r1, r2, r3, r4, r5}, :flush)
  end

  def full_house(rank3c, rankPair) do
    Result.new(@full_house, {rank3c, rankPair}, :full_house)
  end

  def four_oak(rank, k) do
    Result.new(@four_oak, {rank, k}, :four_oak)
  end

  def straight_flush(rank) do
    Result.new(@straight_flush, {rank}, :straight_flush)
  end
end
