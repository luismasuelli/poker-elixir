defmodule Rules.Poker.Mechanics.DeckPickers.Base do
  @moduledoc """
  Defines a spec name and format.

  The name will be an atom.
  The format will be a list of arguments suitable to a call to Assets.Deck.new.
  """

  @callback deck_name
  @callback deck_spec
end
