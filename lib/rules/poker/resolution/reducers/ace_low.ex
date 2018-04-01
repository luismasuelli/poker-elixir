defmodule Rules.Poker.Resolution.Reducers.AceLow do
  @moduledoc """
  Reduction goes like this:
  - A is reduces to 0
  - 2 .. K is reduced to 1 .. 12
  """

  alias Rules.Poker.Resolution.Reducers.Base

  @behaviour Base

  def reduce(14) do
    0
  end

  def reduce(rank) do
    rank - 1
  end
end
