defmodule Rules.Poker.Resolution.Comparers.Base do
  @moduledoc """
  This is a criterion to compare whether a final hand's
    strength should be considered winning, tying, or
    losing against the current status.

  The returned values will be :win, :tie, or :lose.
  """

  @callback compare(new, current)
end
