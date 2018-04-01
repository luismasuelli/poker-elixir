defmodule Rules.Poker.Resolution.DeliveredHands.Cards45Hand do
  @moduledoc """
  A hand of 4/5 delivered cards to calculate the strength for.
  This particular rule is mainly meant to be used in Omaha
    variations, and nowhere else.

  Cards are specified in two sets here: 4 hole cards and 5
    community cards. The final hand will be any combination
    taking 2 out of the 4 cards, and 3 out of the 5 cards.

  Some games computing strength over this deliverance:
  - Omaha variants.

  THIS STRUCTURE IS MADE OF ALREADY-REDUCED CARDS. The reduction
    algorithms will not be discussed here.
  """

  import Rules.Poker.Resolution.DeliveredHands.HandUtils

  defstruct [:cards4, :cards5]

  def new([_, _, _, _] = cards4, [_, _, _, _, _] = cards5) do
    %__MODULE__{cards4: sort(cards4), cards5: sort(cards5)}
  end
end
