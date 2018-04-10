require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

# use byebug to set a breakpoint
#byebug

#Q1 Print all results that have kind of shopping#product

# counter = 0
item_data = data[:items]
# item_data.each do |item|
#   if item[:kind]== "shopping#product"
#   counter +=1;
# end
# end
# puts counter

#########################################################

#Q2 Print the title of all items with a backorder availability in inventories.

# array = []

# item_data.each do |item|
# 	if item[:product][:inventories][0][:availability] == "backorder"
# 		array.push(item[:product][:title])
# 	end
# end

# print array

#Reference 
#data[:items][0][:product][:title]
#data[:items][0][:product][:inventories][0][:availability]

#########################################################

#Q3 Print the title of all items with more than one image link.

# image_array = []

# item_data.each do |item|
# 	if item[:product][:images][1]!=nil
# 		image_array.push(item[:product][:title])
# 	end
# end

# print image_array

#########################################################
#Q4  Print all "Canon" products in the items (careful with case sensitivity).

# canon_array = []

# item_data.each do |item|
# 	if item[:product][:brand]=="Canon"
# 		canon_array.push(item[:product][:title])
# 	end
# end
# print canon_array

#########################################################
#Q5

# ebay_c_array = []

# item_data.each do |item|
# 	if item[:product][:author][:name] == "eBay" && item[:product][:brand]=="Canon"
# 		ebay_c_array.push(item[:product][:title])
# 	end
# end
# print ebay_c_array

#########################################################
#Q6

all_items = []

item_data.each do |item|
all_items
summary = {
 :brand => item[:product][:brand],
 :price => item[:product][:inventories][0][:price],
 :images => item[:product][:images][0]
}

all_items.push(summary)

end

print all_items









