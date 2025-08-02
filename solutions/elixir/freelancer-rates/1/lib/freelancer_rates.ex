defmodule FreelancerRates do
  # calculate daily rate, given an eight hour day and a hourly rate
  def daily_rate(hourly_rate) do
   8.0 * hourly_rate
  end

  # calculate the discounted price, given percentage discount
  def apply_discount(before_discount, discount) do
    before_discount - discount / 100.0 * before_discount
  end

  # calculate the monthly rate, given a 22 day month, an hourly rate, and a discount
  def monthly_rate(hourly_rate, discount) do
    ceil(apply_discount(22 * daily_rate(hourly_rate), discount))
  end

  # calculate the number of workdays given a budget, hourly rate and discount
  def days_in_budget(budget, hourly_rate, discount) do
    # import Float's floor/2 function; this kinda' feels like cheating, except HINTS
    import Float, only: [floor: 2]
    # take the hourly rate, less the discount, and divide it from the budget
    floor(budget / apply_discount( daily_rate(hourly_rate), discount), 1)
  end
end
