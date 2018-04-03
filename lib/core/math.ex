defmodule Core.Math do
  @moduledoc false

  def factorial(n) when is_integer(n) and n >= 0, do: factorial(n, 1)
  defp factorial(0, t), do: t
  defp factorial(n, t), do: factorial(n - 1, n * t)

  def permutations(n, n), do: factorial(n)
  def permutations(n, 0) when is_integer(n) and n >= 0, do: 1
  def permutations(n, 1) when is_integer(n) and n >= 0, do: n
  def permutations(n, r) when is_integer(n) and is_integer(r) and n > r and r >= 0 do
    Enum.reduce((n - r + 1)..n, 1, &(&1 * &2))
  end
  def permutations(n, r) when is_integer(n) and is_integer(r), do: 0

  def combinations(n, n) when is_integer(n) and n >= 0, do: 1
  def combinations(n, 0) when is_integer(n) and n >= 0, do: 1
  def combinations(n, 1) when is_integer(n) and n >= 0, do: n
  def combinations(n, r) when is_integer(n) and is_integer(r) and n > r and r >= 0 do
    permutations(n, r) / factorial(r)
  end
  def combinations(n, r) when is_integer(n) and is_integer(r), do: 0
end
