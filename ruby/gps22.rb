# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Add values to each item in the list
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]
# We would use a hash over here

# Method to add an item to a list
# input: item name and optional quantity
# steps: Add variable inside the method
# output: New item will be added with a new quantity

# Method to remove an item from the list
# input: Use delete to delete an item from the list
# steps: Use .delete to delete a specific item
# output: Removes any unwanted item from the list

# Method to update the quantity of an item
# input: Will take two parameters item and quantity
# steps: Will update items as needed
# output: Specific item will be updated on the list

# Method to print a list and make it look pretty
# input: Print the list to the console
# steps: Use p to print
# output: List will be printed



def create_list(items)
  grocery_list_array = items.split(" ")
  grocery_list = Hash.new
 grocery_list_array.each {|item| grocery_list[item] = 1}
  grocery_list
end

def add_item(item, quantity=1, grocery_list)
  grocery_list[item] = quantity
  grocery_list
end

def remove(item, grocery_list)
  grocery_list.delete(item)
  grocery_list
end

def update(item, new_quantity, grocery_list)
  grocery_list[item] = new_quantity
  grocery_list
end

def print_groceries(grocery_list)
  grocery_list.each {|key,value| puts "#{value} #{key} are needed"}
end

grocery_list = create_list("carrots apples cereal pizza")
p remove("carrots",grocery_list)
p update("apples", 12, grocery_list)
p update("pizza", grocery_list)
print_groceries(grocery_list)
