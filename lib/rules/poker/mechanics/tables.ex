defmodule Rules.Poker.Mechanics.Tables do
  @moduledoc """
  A table, expressed just as a collection of seats, and the central
    pot(s). It does not only process user bets and so, but also
    collects the pots. Also an inner status being:
    - :opening: This status is the first one, when a table is
        being created. Most frequently perceived in tournaments,
        this status can also happen to regular tables.
    - :empty: This status is only useful for regular tables, and
        not for tournaments. A table can reach this status, after
        its cleanup (which occurs after the showdown of the previous
        hand) if there are less than two non-away players in the
        table. The table will remain in this status until one of
        the following options occurs until the table has two or
        more active players:
        - A new player seats, active.
        - An away user stops being away.
    - :registering: This one is only valid in tournaments, when one
        must register before the tournament starts. In Sit&Go tournaments,
        this status is left when all the seats are occupied. In other
        tournaments, this status is left when the registration time
        expires.
    - :audited: After a cleanup, before considering empty or pausing
        a table (respectively), administrators can start auditing this
        table. Gameplay will be frozen until moderators stop auditing.
    - :active: A hand is being played right now.
        PLAYERS CANNOT BE POPPED OFF THE TABLE AT THIS STAGE.
    - :paused: No hand is being played because the table is
        externally paused. This is useful in long poker tournaments,
        which can go beyond 1h and are multitable.
    - :cleanup: This stage occurs right after a showdown is resolved
        and has the task of, e.g., updating away/non-away users.
    - :closing: This stage occurs when a table closes.
        This status is frequently perceived in tournaments, but
        regular tables can also suffer it. NO PLAYERS CAN ENTER OR
        LEAVE AT THIS STAGE.
  And three additional settings:
    - game_type: Whether it is a :regular table, or one belonging to
        a :short tournament (e.g. sit & go) which allows no pauses, or
        a :long tournament (multilevel and/or multitable) which allows
        pauses.
    - auditors: Set of moderators that want to audit.
    - last_events: They just describe the delta actions that occurred in
        the table.
  """

  defmodule Error do
    defexception [:message, :code, :extra]
  end

  defstruct [:chairs, :pots, :status, :auditors, :last_events,
             :game_type]

  def new(x, game_type \\ :regular) when x in [2, 4, 6, 8, 9, 10] and game_type in [:regular, :short, :long] do
    %__MODULE__{chairs: List.duplicate(nil, x), pots: {},
                status: :opening, auditors: MapSet.new,
                game_type: game_type}
  end

  ###################################################################
  #
  # These methods involve a certain flow when actions can be called
  #   or they will raise an exception.
  #
  ###################################################################

  # Tries to sit the player in a given position, unless the user is already
  #   seated, or the sit is not empty.
  def sit!(%__MODULE__{chairs: chairs} = table, position, user_id, hole_chips) when hole_chips > 0 do
    cond do
      Enum.find(chairs, nil, &(&1 != nil and &1.user_id == user_id)) != nil ->
        raise Error, message: "User already seated", code: :already_seated, extra: nil
      Enum.at(chairs, position) != nil ->
        raise Error, message: "Position #{position} is already occupied", code: :occupied_seat, extra: nil
      true ->
        %{ table | chairs: List.replace_at(chairs, position, SeatedPlayer.new(user_id, hole_chips)) }
    end
  end

  # Tries to pop the player from given position, or
  #   raises an error if the position empty.
  def pop!(%__MODULE__{chairs: chairs} = table, position) do
    if Enum.at(chairs, position) == nil do
      raise Error, message: "Nobody seated at position #{position} to pop", code: :no_user_there, extra: nil
    end
    %{ table | chairs: List.replace_at(chairs, position, nil) }
  end

  # Returns a list of chairs, starting from a specific index to
  #   be taken as pivot. Usually, the list is considered circular.
  def linearize_chairs(%__MODULE__{chairs: chairs}, pivot) do
    {foo, bar} = Enum.split(chairs, pivot)
    bar ++ foo
  end
end
