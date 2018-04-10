require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

kind = "shopping#product"
availability = "backorder"
brand = "Canon"
author = "eBay"

# Retrieve the products in the items array
item_data = data[:items]

# pp data

# use byebug to set a breakpoint
#byebug

# Write your solutions below

# -------------------------Question 1-------------------------------------------
# count = 0
# item_data.each do |item|
#   if item[:kind] == kind
#     count += 1
#   end
# end
# puts "Number of items with kind of shopping#product => #{count}"
# puts "Number of items with kind of shopping#product => #{data[:currentItemCount]}"

# -------------------------Question 2-------------------------------------------
# item_title = []
# item_data.each do |item|
#   if item[:product][:inventories][0][:availability] == availability
#     item_title.push(item[:product][:title])
#   end
# end
# puts "Print the title of all items with a backorder availability in inventories => \n#{item_title}"

# -------------------------Question 3-------------------------------------------
# item_title = []
# item_data.each do |item|
#   if item[:product][:images].length > 1
#     item_title.push(item[:product][:title])
#   end
# end
# puts "Title of all items with more than one image link. => \n#{item_title}"

# -------------------------Question 4-------------------------------------------
# canon_products = []
# item_data.each do |item|
#   if item[:product][:brand] == brand
#     canon_products.push(item)
#   end
# end
# puts "Print all Canon products in the items (careful with case sensitivity) =>"
# canon_products.each do |product|
#   pp product
# end

# -------------------------Question 5-------------------------------------------
# items = []
# item_data.each do |item|
#   if item[:product][:brand] == brand && item[:product][:author][:name] == author
#     items.push(item)
#   end
# end
# puts "Print all items that have an author name of eBay and are brand Canon =>"
# items.each do |product|
#   pp product
# end

# -------------------------Question 6-------------------------------------------
all_products = []
item_data.each do |item|
  product = {
    :brand => item[:product][:brand],
    :price => item[:product][:inventories][0][:price],
    :image => item[:product][:images]
  }
  all_products.push(product)
end
puts "Print all the products with their brand, price, and an image link => "
all_products.each do |product|
  pp product
end
