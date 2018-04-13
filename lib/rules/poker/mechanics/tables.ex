defmodule Rules.Poker.Mechanics.Tables do
  @moduledoc """
  A table, expressed just as a collection of seats.
  """

  defstruct [:chairs]

  def new(x) when x in [2, 4, 6, 8, 9, 10] do
    %__MODULE__{chairs: List.duplicate(nil, x)}
  end

  # Tries to sit the player in a given position, unless the user is already
  #   seated, or the sit is not empty.
  def sit!(%__MODULE__{chairs: chairs} = table, position, user_id, hole_chips) when hole_chips > 0 do
    cond do
      Enum.find(chairs, nil, &(&1 != nil and &1.user_id == user_id)) != nil ->
        raise ArgumentError, message: "User already seated"
      Enum.at(chairs, position) != nil ->
        raise ArgumentError, message: "Position #{position} is already occupied"
      true ->
        %{ table | chairs: List.replace_at(chairs, position, SeatedPlayer.new(user_id, hole_chips)) }
    end
  end

  # Tries to pop the player from given position, or
  #   raises an error if the position empty.
  def pop!(%__MODULE__{chairs: chairs} = table, position) do
    if Enum.at(chairs, position) == nil do
      raise ArgumentError, message: "Nobody seated at position #{position} to pop"
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
