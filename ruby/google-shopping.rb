require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# use byebug to set a breakpoint
#byebug

# Write your solutions below

# Go through the items and find all results that have kind of shopping#product. Print the count of these results. Where else is this count information stored in the search results?
def get_items(object_data)
  object_data[:items]
end

def shoppingProductKind(item_array)
  item_array.select do |item|
    item[:kind] == "shopping#product"
  end
end

# 2.) Print the title of all items with a backorder availability in inventories.
def backorderAvailability(item_array)
  titles = []
  item_array.select do |item|
    titles.push(item[:product][:title]) if item[:product][:inventories][0][:availability] == "backorder"
  end
  return titles
end

# 3.) Print the title of all items with more than one image link.
def moreThanOneImage(item_array)
  titles = []
  item_array.select do |item|
    titles.push(item[:product][:title]) if item[:product][:images].length > 1
  end
  return titles
end

# 4.) Print all "Canon" products in the items (careful with case sensitivity).
def canonProducts(item_array)
  products = []
  item_array.select do |item|
    products.push(item[:product]) if item[:product][:brand].downcase.include?("canon")
  end
end

# 5.) Print all items that have an author name of "eBay" and are brand "Canon".
def eBayAndCanon(item_array)
  item_array.select do |item|
    item[:product][:author][:name].include?("eBay") && item[:product][:brand].downcase.include?("canon")
  end
end

# 6.) Print all the products with their brand, price, and an image link
def printAll(item_array)
  item_array.select do |item|
    puts "Brand: #{item[:product][:brand]}, Price: #{item[:product][:inventories][0][:price]}, image link: #{item[:product][:images][0][:link]}"
  end
  return
end

# puts "Num shopping product items: #{shoppingProductKind(get_items(data)).length}"
#
# puts "backorder availability: #{backorderAvailability(get_items(data))}"

# puts "#{moreThanOneImage(get_items(data))}"

# puts "Canon products: #{canonProducts(get_items(data))}"

# puts "eBay and Canon products: #{eBayAndCanon(get_items(data))}"

puts "#{printAll(get_items(data))}"
