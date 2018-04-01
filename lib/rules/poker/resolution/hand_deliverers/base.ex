defmodule Rules.Poker.Resolution.HandDeliverers.Base do
  @moduledoc """
  Hand deliverers take many elements from both the user
    state (their cards) and the general table state
    (this applies to games with community cards).

  The way they do it depends from each game, however.

  Delivering involves two stages:
  - Preparing the general table state: Most of the
      times this will involve reducing the community
      cards.
  - Returning a delivered hand: This will involve two
      sub-steps:
    - Reducing the cards in the user state.
    - Generate a specific delivered hand using both
        the just-reduced user cards, and the reduced
        cards from the table status.

  Known deliverers:
    algorithm : user cards -> (table status) -> delivered_hand
    -----------------------------------------------------------
    Hold'Em   : 2          -> 5 Commie Cards -> Cards7
    Omaha     : 4          -> 5 Commie Cards -> Cards45
    Stud (<8) : 7          -> Nothing        -> Cards7
    Stud (8)  : 6          -> 1 Commie Card  -> Cards7
    Draw      : 5          -> Nothing        -> Cards5
    Badugi    : 4          -> Nothing        -> Cards4
  """

  @callback table_digest(reducer, table_state)
  @callback deliver(reducer, user_state, table_digest)
end
