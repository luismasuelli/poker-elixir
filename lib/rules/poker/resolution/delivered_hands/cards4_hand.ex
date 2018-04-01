defmodule Rules.Poker.Resolution.DeliveredHands.Cards4Hand do
  @moduledoc """
  A hand of 4 delivered cards to calculate the strength for.

  These 4 cards hold the whole information to be analized and
    computed.

  Some games computing strength over this deliverance:
  - Badugi

  THIS STRUCTURE IS MADE OF ALREADY-REDUCED CARDS. The reduction
    algorithms will not be discussed here.
  """

  alias Rules.Poker.Resolution.DeliveredHands.HandUtils

  defstruct [:cards4]

  def new([_, _, _, _] = cards4) do
    %__MODULE__{cards4: HandUtils.sort(cards4)}
  end
end
