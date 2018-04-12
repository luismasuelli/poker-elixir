defmodule Rules.Poker.Mechanics.DeckPickers.Standard52 do
  @moduledoc """
  This one stands for a regular poker deck.
    - 1 copy.
    - 0 wildcards.
    - All suits and ranks.
  """

  alias Rules.Poker.Mechanics.DeckPickers.Base

  @behaviour Base

  def deck_name do
    :standard52
  end

  def deck_spec do
    {0}
  end
end
