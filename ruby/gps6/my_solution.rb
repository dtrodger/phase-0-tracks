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

  def num_deaths(multi)
    (@population * multi).floor
  end

  def predicted_deaths
    population_hash = {200 => 0.4, 150 => 0.3, 100 => 0.2, 50 => 0.1, 0 => 0.05}
    population_hash.each do |pop_density, multi|
      if @population_density >= pop_density
        number_of_deaths = num_deaths(multi)
        return "#{@state} will lose #{number_of_deaths} people in this outbreak"
        break
      end
    end
  end

  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

STATE_DATA.each do |state, population_hash|
  new_state = VirusPredictor.new(state, population_hash[:population_density], population_hash[:population])
  new_state.virus_effects
end
