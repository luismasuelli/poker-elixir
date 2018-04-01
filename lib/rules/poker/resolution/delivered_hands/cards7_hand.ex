defmodule Rules.Poker.Resolution.DeliveredHands.Cards7Hand do
  @moduledoc """
  A hand of 7 delivered cards to calculate the strength for.

  These 7 cards hold the whole information to be analized and
    computed. This will involve, most of the times, that a
    combination of 5 out of these 7 cards will be taken as
    the best combination to compare later.

  Some games computing strength over this deliverance:
  - Hold'Em.
  - 7-card Stud variants.

  THIS STRUCTURE IS MADE OF ALREADY-REDUCED CARDS. The reduction
    algorithms will not be discussed here.
  """

  import Rules.Poker.Resolution.DeliveredHands.HandUtils

  defstruct [:cards7]

  def new([_, _, _, _, _, _, _] = cards7) do
    %__MODULE__{cards7: sort(cards7)}
  end
end
