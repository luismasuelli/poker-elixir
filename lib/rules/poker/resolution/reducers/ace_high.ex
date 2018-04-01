defmodule Rules.Poker.Resolution.Reducers.AceHigh do
  @moduledoc """
  Reduction goes like this:
  - 2 .. K, A is reduced to 0 .. 12
  """

  alias Rules.Poker.Resolution.Reducers.Base

  @behaviour Base

  def reduce(rank) do
    rank - 2
  end
end
