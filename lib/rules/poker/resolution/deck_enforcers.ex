defmodule Rules.Poker.Resolution.DeckEnforcers do
  @moduledoc """
  Executes the verification of a deck to a specified
    format (depending on the module chosen to enforce
    a deck format).
  """

  alias Assets.Deck

  def enforce(module, %Deck{} = deck) do
    if module.deck_allowed(deck) do
      raise ArgumentError, message: "An invalid deck was given"
    end
  end
end
