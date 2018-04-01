defmodule Rules.Poker.Resolution.Filters.Base do
  @moduledoc """
  Filters a hand and tells whether it qualifies
    or not to the final stage.
  """

  @callback passes(%{cards: _})
end
