defmodule Rules.Poker.Resolution.Comparers do
  @moduledoc """
  Performs a comparison over the current status of
    the showdown. The comparison will not be over
    the whole game but just over a specific sub-game.
    An example of this: Hi/Lo games.
  This will provide two behaviours:
  - Create a new showdown status.
  - Compare a hand and, perhaps, update the current
      showdown status.
  """

  def start_comparison(), do: %{spec: nil, winners: []}

  def compare(module, player, spec, state) do
    case module.compare(spec, state.spec) do
      :win -> {:win, %{ state | spec: spec, winners: [player]}}
      :tie -> {:tie, %{ state | winners: [player | state.winners]}}
      :lose -> {:lose, state}
    end
  end
end
