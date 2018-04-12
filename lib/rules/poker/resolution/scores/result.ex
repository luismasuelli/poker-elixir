defmodule Rules.Poker.Resolution.Scores.Result do
  @moduledoc """
  Scores are qualitative and tell what type of
    result is a hand. Stored data will be:

    - The hand type.
    - The involved hand values, if type is the
        same.
    - The hand category, for filters and custom
        logic and display.

  The main disadvantage is that we lose the ability
    to compute percentage or absolute values here.

  However Elixir makes comparing these hands quite
    easy by the lexical check of lists.
  """

  defstruct [:cmp_data, :category]

  def new(type, ranks, category) do
    %__MODULE__{cmp_data: {type, ranks}, category: category}
  end

  def %__MODULE__{cmp_data: c1} <~> %__MODULE__{cmp_data: c2} do
    cond do
      c1 < c2 -> -1
      c1 == c2 -> 0
      c1 > c2 -> 1
    end
  end
end
