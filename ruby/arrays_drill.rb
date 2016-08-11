
def build_array (item1, item2, item3)
	array = [item1, item2, item3]
	array
end

array = []
p array

array += [1,2,3,4,5]
p array

array.delete_at(2)
p array

array.insert(2, "new")
p array

array.shift
p array

include_5 = array.include? 5
puts "Array includes a 5? "+include_5.to_s

new_array = [6,7,8,9,10]

combined_array = array.concat new_array
p combined_array

p build_array(1, "two", 3)

def add_to_array (array, item)
	array << item
	array
end

test_array = ["a","b","c"]

p add_to_array(test_array,"d")

p add_to_array(test_array, 4)

p add_to_array([1,2,3], "four")








