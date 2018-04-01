defmodule Rules.Poker.Resolution.Filters do
  @moduledoc """
  Executes the verification of a hand to tell
    whether it should be considered accepted
    to participate or not in the last stage
    of the showdown.

  It returns nil if the hand fails to pass.
  """

  def filter(module, hand) do
    if module.passes(hand) do
      hand
    else
      nil
    end
  end
end
