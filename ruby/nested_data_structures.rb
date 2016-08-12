# Define a nested data structure

mma_arsenal = { striking: { lefthand: ['straight lead', 'jab'], righthand: ['overhand right', 'straight right'], leftleg: ['axe kick', 'high left'], rightleg: ['right side kick', 'spinning hook kick']}, wrestling: ['single leg takedown', 'double leg takedown', 'whizzer'], jiujitsu: {chokes: ['rear naked choke', 'guillotine choke'], armlocks: ['arm bar', 'americana'], leglocks: ['heel hook', 'toe hold']}}

p mma_arsenal[:striking]
p mma_arsenal[:wrestling][1]
p mma_arsenal[:jiujitsu][:leglocks].first()
p mma_arsenal[:striking][:lefthand]

mma_arsenal[:jiujitsu][:armlocks][0] = "omoplata"
p mma_arsenal[:jiujitsu][:armlocks]

p mma_arsenal[:striking].to_a

