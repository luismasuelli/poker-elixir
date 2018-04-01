defmodule Rules.Poker.Resolution.Filters.AllowAll do
  @moduledoc """
  This accepts all hands. No hand will be rejected
    no matters how bad the hand is.
  """

  alias Rules.Poker.Resolution.Filters.Base

  @behaviour Base

  def passes(%{cards: _}) do
    true
  end
end
