defmodule Assets.Deck do
  @moduledoc false

  require Assets.Deck.Card

  defstruct [:cards, :ranks, :suits, :copies, :wildcards]

  def new(wildcards \\ 2, ranks \\ :all, suits \\ :all, copies \\ 1)
      when (is_integer(wildcards) and wildcards >= 0) and
           (is_list(suits) or suits == :all or suits == :empty) and
           (is_list(ranks) or ranks == :all or suits == :empty) and
           (is_integer(copies) and copies >= 0) do
    ranks_ = fix_ranks(ranks)
    suits_ = fix_suits(suits)
    %__MODULE__{cards: add_copies(wildcards, ranks_, suits_, copies),
                ranks: ranks_, suits: suits_, copies: copies, wildcards: wildcards}
  end

  def shuffle(%__MODULE__{cards: cards, ranks: _, suits: _, copies: _, wildcards: _} = deck) do
    %{ deck | cards: Enum.shuffle(cards) }
  end

  defp fix_suits(:all) do
    Assets.Deck.Card.suits
  end

  defp fix_suits(:empty) do
    []
  end

  defp fix_suits(suits) do
    Enum.sort(suits)
  end

  defp fix_ranks(:all) do
    Assets.Deck.Card.ranks
  end

  defp fix_ranks(:empty) do
    []
  end

  defp fix_ranks(ranks) do
    Enum.sort(ranks)
  end

  defp add_copies(wildcards, ranks, suits, copies) do
    Enum.reduce(1..copies, [], fn(_, current) ->
      adding_cards = Enum.reduce(ranks, current, fn(rank, current) ->
        Enum.reduce(suits, current, fn(suit, current) ->
          [Assets.Deck.Card.new(rank, suit) | current]
        end)
      end)
      Enum.reduce(1..wildcards, adding_cards, fn(_, current) ->
        [Assets.Deck.Card.new(:wildcard) | current]
      end)
    end)
  end
end
