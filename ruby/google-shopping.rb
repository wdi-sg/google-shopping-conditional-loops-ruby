require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
$data = JSON.parse(file, {:symbolize_names => true})[:items]

pp data

# use byebug to set a breakpoint
#byebug

# Write your solutions below

# 1.) Go through the items and find all results that have kind of shopping#product. Print the count of these results. Where else is this count information stored in the search results?
def count_all_shopping_products
    puts $data.select{|item| item[:kind] == 'shopping#product'}.length
end
# 2.) Print the title of all items with a backorder availability in inventories.
def print_titles_of_backorders
    pp $data.select{|item| item[:product][:inventories][0][:availability] == 'backorder'}.map{|obj| obj[:product][:title]}
end
# 3.) Print the title of all items with more than one image link.
def print_titles_of_items_with_more_than_one_image
    pp $data.select{|item| item[:product][:images].length > 1}.map{|obj| obj[:product][:title]}
end
# 4.) Print all "Canon" products in the items (careful with case sensitivity).
def find_products_by_brand(brand = 'Canon')
    pp $data.select{|item| item[:product][:brand].downcase == brand.downcase}
end

# 5.) Print all items that have an author name of "eBay" and are brand "Canon".
def print_items_with_name_ebay_and_brand_canon(author = 'eBay', brand = 'Canon')
    pp $data.select{|item| item[:product][:author][:name].downcase == author.downcase && item[:product][:brand].downcase == brand.downcase}
end

# 6.) Print all the products with their brand, price, and an image link
def print_brand_price_image_of_all_products
    pp $data.map{|obj| "brand: #{obj[:product][:brand]}, price: #{obj[:product][:inventories][0][:price]}, image: #{obj[:product][:images][0][:link]}"}
end