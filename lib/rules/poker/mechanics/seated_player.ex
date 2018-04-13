defmodule Rules.Poker.Mechanics.SeatedPlayer do
  @moduledoc """
  A SP status is just a data structure defining
    the following details regarding their play in
    this turn:
    - status: :active, :all_in, :away, :folded.
        Other useful statuses:
        - :pending: The [new] hand has not yet
            started. Non-away users enter this stage
            after a hand ends. Fresh users, when just
            sitting, enter this stage. Starting a new
            hand will involve moving these users to
            active.
    - user_id: I don't know yet. Either a unique ID
        or username. What I only require is that this
        user_id is UNIQUE AMONG THE WHOLE SERVER.
    - aggression_order: The initial aggression order
        comes each turn (complete hand!) to 0, both
        for the table's internal counter and the
        users. Each time one user bets or raises,
        the table's aggression order increases, and
        such value is set to the user's current status.
        The active/all_in user with the highest
        aggression_order in one hand will be the first
        one commanded to start the showdown.
    - hole_chips: The chips the user has FOR THIS TABLE.
        This has nothing to do with the chips the user
        has on its overall account (if such thing ever
        exists!).
    - cards: the user's current cards. Hand deliverers
        will pick exactly THESE cards (alongside any
        community cards if the game has one).
    - bet_chips: The chips the user is currently betting
        in this round. This constitutes a "personal" pot
        for bets that lasts until the current betting
        stage gets "cold" (all but one player folded,
        all active players called the last aggressor,
        just one active and all remaining active players
        are actually all-in...).

    This structure is for regular games, and does not contemplate
      other modes like "Shark's Cage" when you may be forcedly
      away, and you may pick and send a card when being the last
      aggressor after the river.
  """

  defstruct [:user_id, :status, :hole_chips, :cards,
             :bet_chips, :aggression_order]

  def new(user_id, hole_chips) do
    %__MODULE__{user_id: user_id, status: :pending, hole_chips: hole_chips,
                cards: nil, aggression_order: 0}
  end

  # When the user retreats
  def fold(%__MODULE__{} = user_status) do
    %{ user_status | status: :fold }
  end

  # When the user places a bet and has more money, it
  #   remains active.
  def pay(%__MODULE__{hole_chips: hc, bet_chips: bc} = user_status, amount) when hc > amount do
    %{ user_status | hole_chips: hc - amount, bet_chips: bc + amount }
  end

  # This case goes all-in, in contrast to the former one
  def pay(%__MODULE__{hole_chips: hc, bet_chips: bc} = user_status, _) do
    %{ user_status | hole_chips: 0, bet_chips: bc + hc, status: :all_in }
  end

  # This one is when the engine collects the bet chips from the user.
  # Useful when building the side pots.
  def collect(%__MODULE__{} = user_status) do
    %{ user_status | bet_chips: 0 }
  end

  # This one is when the engine awards the user. Only valid when the
  #   user wins a hand.
  def award(%__MODULE__{hole_chips: hc} = user_status, amount) do
    %{ user_status | hole_chips: hc + amount }
  end

  # When the showdown ends and the user is
  #   non-away and does not wan to be away,
  #   or is away and wants to be non-away
  #   again.
  def cleanup(%__MODULE__{} = user_status) do
    %{ user_status | status: :pending }
  end

  # When the showdown ends and the user wants to
  #   go away.
  def away(%__MODULE__{} = user_status) do
    %{ user_status | status: :away }
  end
end
