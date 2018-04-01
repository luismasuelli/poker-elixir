defmodule Rules.Poker.Resolution.Reducers.Base do
  @moduledoc """
  Reduces a rank to a 0-based value useful for strength
    computations.
  """

  @callback reduce(rank)
end
