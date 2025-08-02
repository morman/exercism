defmodule GuessingGame do
  # default guard
  def compare(secret_number, guess \\ :no_guess)

  def compare(_secret_number, guess) when guess == :no_guess do
    # nothing entered
    "Make a guess"
  end

  def compare(secret_number, guess) when guess == secret_number do
    # exact match
    "Correct"
  end

  def compare(secret_number, guess) when abs(guess - secret_number) == 1 do
    # one more or one less than the secret number
    "So close"
  end

  def compare(secret_number, guess) when guess > secret_number do
    # the guess is greater than the secret number
    "Too high"
  end

  def compare(secret_number, guess) when guess < secret_number do
    # the guess is lower than the secret number
    "Too low"
  end
end
