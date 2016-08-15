array = ["goodfellas", "interstellar", "pulp fiction"]

hash = {robert_de_niro: "jimmy conway", matthew_mcconauy: "cooper", john_travolta: "vincent vega"}

array.each {|x| print x, " " }

puts array.map! {|value| value + " map mutation" }