defmodule Rules.Poker.Resolution.Comparers.Low do
  @moduledoc """
  Hand comparison is performed by high criterion.
  This involves:
  - If the hand is higher, then :win.
  - If the hand is tied, then :tie.
  - If the hand is lower, then :lose.
  """

  alias Rules.Poker.Resolution.Comparers.Base

  @behaviour Base

  def compare(new, current) when new > current, do: :lose
  def compare(new, current) when new == current, do: :tie
  def compare(new, current), do: :win
end
