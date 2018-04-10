require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

items_arr = data[:items]
items_qty = items_arr.length

pp items_qty
# pp items_arr[0][:product][:inventories][0][:availability]

# use byebug to set a breakpoint
#byebug

# Write your solutions below

# 1. Go through items and find all results that have kind = shopping#product

first_result = items_arr.select do |item|
  item[:kind] == "shopping#product"
end


# pp first_result

# 2. Print title of all items with backorder availability in inventories

# second_result = items_arr.select do |item|
#   item_status = item[:product][:inventories][0][:availability]
#   item_status == "backorder"
# end

second_result = items_arr.select{|item| item[:product][:inventories][0][:availability] == "backorder"}.map{|filtered| filtered[:product][:title]}


# pp second_result

# 3. Print title of all items with more than one image link

third_result = items_arr.select{|item| item[:product][:images].length > 1}.map{|filtered| filtered[:product][:title]}

# pp third_result

# 4. Print all Canon products 

fourth_result = items_arr.select{|item| item[:product][:brand].downcase == "canon"}

# pp fourth_result

# 5. Print all items with author name "ebay" and Canon brand

fifth_result = items_arr.select{|item| item[:product][:author][:name].downcase.include? "ebay"}.select{|filtered| filtered[:product][:brand].downcase == "canon"}

# pp fifth_result

# 6. Print all items with brand, price, image link
special_items_arr = []
items_arr.each{|item| special_items_arr.push({
  :brand => item[:product][:brand],
  :price => item[:product][:inventories][0][:price],
  :image => item[:product][:images]
})}

pp special_items_arr