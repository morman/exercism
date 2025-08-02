=begin
Write your code for the 'Space Age' exercise in this file. Make the tests in
`space_age_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/space-age` directory.
=end

class SpaceAge
  # add support for age attr
  attr_accessor :age

  # define seconds per year
  SECONDS_PER_YEAR = 31557600

  def initialize(age)
    @age = age
  end

  def on_earth
    # convert seconds to years with floating point division
    @age.fdiv(SECONDS_PER_YEAR)
  end

  def on_mercury
    # convert seconds to years with floating point division, then convert Earth to planet

    @age.fdiv(SECONDS_PER_YEAR).fdiv(0.2408467)
  end

  def on_venus
    # convert seconds to years with floating point division, then convert Earth to planet
    @age.fdiv(SECONDS_PER_YEAR).fdiv(0.61519726)
  end

  def on_mars
    # convert seconds to years with floating point division, then convert Earth to planet
    @age.fdiv(SECONDS_PER_YEAR).fdiv(1.8808158)
  end

  def on_jupiter
    # convert seconds to years with floating point division, then convert Earth to planet
    @age.fdiv(SECONDS_PER_YEAR).fdiv(11.862615)
  end

  def on_saturn
    # convert seconds to years with floating point division, then convert Earth to planet
    @age.fdiv(SECONDS_PER_YEAR).fdiv(29.447498)
  end

  def on_uranus
    # convert seconds to years with floating point division, then convert Earth to planet
    @age.fdiv(SECONDS_PER_YEAR).fdiv(84.016846)
  end

  def on_neptune
    # convert seconds to years with floating point division, then convert Earth to planet
    @age.fdiv(SECONDS_PER_YEAR).fdiv(164.79132)
  end

end