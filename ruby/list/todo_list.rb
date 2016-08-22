class TodoList
	def initialize(list)
		@list = list
	end

	def get_items
		@list
	end

	def add_item(item)
		return @list << item
	end

	def delete_item(item)
		if @list.include?(item)
			@list.select! {|val| val != item}
		else
			puts "Item is not present in list."
		end
	end

	def get_item(num)
		if num > @list.length
			puts "Index exceeds list length."
		else
			@list[num]
		end
	end
end