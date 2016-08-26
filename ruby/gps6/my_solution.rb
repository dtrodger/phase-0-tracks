# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
#
#
#require_relative allows this file to access the code from state_data which is in the same directory
require_relative 'state_data'

class VirusPredictor

#initilaizes the class with the attributes state_of_origin, population_density, population
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  #calls predicted_deaths and speed_of_spread
  def virus_effects
    print predicted_deaths
    print speed_of_spread
  end

  private

  #calculates the number of deaths based on population and mulit
  def num_deaths(multi)
    (@population * multi).floor
  end

  #decides multi based on pop density, calls num_deaths, returns string with numb deaths
  def predicted_deaths
    population_hash = {200 => 0.4, 150 => 0.3, 100 => 0.2, 50 => 0.1, 0 => 0.05}
    population_hash.each do |pop_density, multi|
      if @population_density >= pop_density
        number_of_deaths = num_deaths(multi)
        return "#{@state} will lose #{number_of_deaths} people in this outbreak"
      end
    end
  end

  #calculates the speed the virus will spread based on population density
  def speed_of_spread #in months
    speed_hash = {200 => 0.5, 150 => 1, 100 => 1.5, 50 => 2, 0 => 2.5}
    speed_hash.each do |pop_density, new_speed|
      if @population_density >= pop_density
        speed = new_speed
        return " and will spread across the state in #{speed} months.\n\n"
      end
    end
  end

end

#=======================================================================

# DRIVER CODE

STATE_DATA.each do |state, population_hash|
  new_state = VirusPredictor.new(state, population_hash[:population_density], population_hash[:population])
  new_state.virus_effects
end

