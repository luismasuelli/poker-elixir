A poker hand preparing will start like this:

  dp_module : determines what deck we should pick.

  1. Picking the deck.
     Running: Rules.Poker.Mechanics.DeckPickers.pick(dp_module, pid).
     This will be run before any deal. The `pid` belongs to an actor
       that stores and provides the deck to avoid generating it for
       each time/hand.

  gm_module : determines what mechanics the game will run.

  2. Playing the round.

  # TODO this deserves a special attention and will be quite
  # TODO   complex since this one will be the actual big part
  # TODO   of the game.

A poker showdown will go like this:

  3. Opening N possible contexts, in terms of priorities (e.g. Hi/Lo, Back/Front).
     Each context will run as follows:

     dv_module : determines what kind of deliverance will be done in this context.
     rd_module : determines what kind of reduction on the deliverance will be done
       in this context.

  C1. Delivering the hand. The table provides all the users having %{cards: c}.
        The criteria to pick the first user varies from game to game.

  # TODO implement such criteria of picking the first user
  # TODO   (i.e. button vs non-button games)

      pm_module : determines what kind of pattern matching will be done
        in this context.

  C2. The hand will be pattern-matched to obtain the appropriate score.

  # TODO complete the implementation of different pattern matchers.

      ft_module : determines, for each hand, whether it qualifies or not
        in this context.

  C3. The hand will be filtered to see whether it qualifies (e.g. bust8< in Lo
        context). The context will be halted if there are no qualifying hands.

      cm_module : determines if the comparison will be high or low.
        this determines whether a higher score wins (Hold'Em, regular Draw,
        Hi games, and the current implementation of Badugi) or loses (Lo
        games, Razz, 2-7 Triple Draw).

  C4. The qualifying hands will be compared in the same order of users provided
        by the table, and winners will be determined.

  # TODO implement this part. An iteration/reduction all over the table, disregarding
  # TODO   the check against an initial status (the player always wins) and non-qualifying
  # TODO   hands (the new hand will be nil for being disqualified, and so it is skipped).

  C5. The played contexts will equally split ALL the pots (main and side pots) in the
        same ratios. This will involve only active contexts (where at least one player
        has a qualifying hand to play it). Usually the split is 1/n of each pot to a
        corresponding sub-main/sub-side pot for the context, where n is the amount of
        contexts (usually 1 or 2 contexts), and the odd chips of each context split
        always go to the first context (in order of declaration - usually Hi comes
        before Lo).

  # TODO this part is not implemented.

      ps_module : a module that will take the criteria over awarding remainder
        chips for the users.

  C6. The winners for each context have been determined in step C4.
      Strictly going context by context, we review each sub-main/sub-side pot and
        the winners, and award the pots by proper splitting (and awarding the
        remainder chips properly).

  # TODO this part is not implemented.