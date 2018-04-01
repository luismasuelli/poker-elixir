defmodule Rules.Poker.Resolution.DeckEnforcers.Base do
  @moduledoc """
  Enforces a specific deck format, depending on how it was
    generated.
  """

  alias Assets.Deck

  @callback deck_allowed(%Deck{})
end
