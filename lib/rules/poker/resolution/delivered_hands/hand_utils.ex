defmodule Rules.Poker.Resolution.DeliveredHands.HandUtils do
  @moduledoc """
  Utils for the delivered hands.
  """

  def sort(cards) when is_list(cards), do: Enum.sort_by(cards, &(-&1.rank))
end
