require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# use byebug to set a breakpoint
#byebug

# Write your solutions below

itemCount = 0
backorderArray = []
moreImageLinks = []
canonItems = []
ebayCanonItems = []
allItemsSpecific = []

data[:items].each do |item|
	if item[:kind] == "shopping#product"
		itemCount += 1
	end
	if item[:product][:inventories][0][:availability] == "backorder"
		backorderArray.push(item[:product][:title])
	end
	if item[:product][:images].length > 1
		moreImageLinks.push(item[:product][:title])
	end
	if item[:product][:brand] == "Canon"
		canonItems.push(item[:product][:title])
	end
	if item[:product][:author][:name].include? "eBay" and item[:product][:brand] == "Canon"
		ebayCanonItems.push(item[:product][:title])		
	end
	storeItem = "Product: #{item[:product][:title]} \n price: #{item[:product][:inventories][0][:price]} \n link: #{item[:product][:images][0]}" 
	allItemsSpecific.push(storeItem);
end

puts "1. Shopping products appear #{itemCount} times"
puts "2. List of items with backorder availability"
puts backorderArray
puts "3. List of items with more than one image link:"
puts moreImageLinks
puts "4. List of Canon products"
puts canonItems
puts "5. List of Canon products by Ebay"
puts ebayCanonItems
puts "6. List of all items with their brand, image and price"
puts allItemsSpecific
