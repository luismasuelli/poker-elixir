defmodule Rules.Poker.Resolution.DeliveredHands.Cards5Hand do
  @moduledoc """
  A hand of 5 delivered cards to calculate the strength for.

  These 5 cards hold the whole information to be analized and
    computed.

  Some games computing strength over this deliverance:
  - Draw variants.

  THIS STRUCTURE IS MADE OF ALREADY-REDUCED CARDS. The reduction
    algorithms will not be discussed here.
  """

  alias Rules.Poker.Resolution.DeliveredHands.HandUtils

  defstruct [:cards5]

  def new([_, _, _, _, _] = cards5) do
    %__MODULE__{cards5: HandUtils.sort(cards5)}
  end
end
