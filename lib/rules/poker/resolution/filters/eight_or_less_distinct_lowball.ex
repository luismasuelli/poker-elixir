defmodule Rules.Poker.Resolution.Filters.EightOrLessDistinctLowball do
  @moduledoc """
  This accepts all hands. No hand will be rejected
    no matters how bad the hand is.
  """

  alias Rules.Poker.Resolution.Filters.Base

  @behaviour Base

  def passes(%{cards: [%{rank: r1}, %{rank: r2}, %{rank: r3}, %{rank: r4}, %{rank: r5}]}) do
    # It is assumed to be ordered in descendant way.
    # Also, the first (highest) card must be at most 8
    #   in ace-low modes (its reduced value is 7).
    r1 > r2 and r2 > r3 and r3 > r4 and r4 > r5 and r1 <= 7
  end
end
