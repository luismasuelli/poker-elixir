defmodule Rules.Poker.Resolution.Filters.EightOrLessDistinctLowball do
  @moduledoc """
  This accepts all hands. No hand will be rejected
    no matters how bad the hand is.
  """

  alias Rules.Poker.Resolution.Filters.Base
  alias Rules.Poker.Resolution.Scores.Result

  @behaviour Base

  def passes(%Result{cmp_data: {_, {r1, _, _, _, _}}, category: :bust}) do
    # It is assumed to be ordered in descendant way.
    # Also, the first (highest) card must be at most 8
    #   in ace-low modes (its reduced value is 7).
    r1 <= 7
  end

  def passes(_) do
    false
  end
end
