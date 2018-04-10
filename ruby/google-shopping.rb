require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# use either pp or puts

# use byebug to set a breakpoint
#byebug

# Write your solutions below

# 1. Go through the items and find all results that have kind of shopping#product. Print the count of these results. 
# Where else is this count information stored in the search results?

count = 0 # i = 0
data[:items].each do |item|
	# so for each :kind == "shopping#product", console will count +1
	if item[:kind] == "shopping#product"
		count +=1 # +=1
	end #for do
end	#for if
pp count # Ans: 25

# 2. Print the title of all items with a backorder availability in inventories.

data[:items].each do |item|
	if item[:product][:inventories][0][:availability] == "backorder"
	
	puts item[:product][:title]
	end
end

# 3. Print the title of all items with more than one image link.

data[:items].each do |item|
	if item[:product][:images].length > 1
		puts item[:product][:title]
	end
end

# 4. Print all "Canon" products in the items (careful with case sensitivity).

data[:items].each do |item|
	if item[:product][:brand] == "Canon"
		puts item[:product][:title]
	end
end

# 5. Print all items that have an author name of "eBay" and are brand "Canon".

data[:items].each do |item|
	if item[:product][:brand] == "Canon" && item[:product][:author][:name]
		#byebug
		puts item[:product][:title]
	end
end

# 6. Print all the products with their brand, price, and an image link

data[:items].each do |item|
	puts item[:product][:brand]
	puts item[:product][:inventories][0][:price] 
	puts item[:product][:images][0]
end











