defmodule Rules.Poker.Resolution.HandDeliverers do
  @moduledoc """
  Executes the deliverance of poker hands. Different
    poker games will use different mechanism.

  A list of users' states will be received, along with
    the table state. Also, a hand deliverer module and
    a reducer module will be specified.

  This util will take both modules and:
    - Take the table state and process it (usually using
      the specified reducer).
    - Take the users, the processed table state, and also
      process them (usually using the specified reducer).
  """

  alias Rules.Poker.Resolution.Reducers

  def deliver_hands(deliverer, reducer, table_state, user_states) do
    reducer_func = &(Reducers.reduce(reducer, &1))
    processed_table_state = deliverer.table_digest(reducer_func, table_state)
    Enum.map(users, &(deliverer.deliver(reducer_func, &1, processed_table_state)))
  end
end
