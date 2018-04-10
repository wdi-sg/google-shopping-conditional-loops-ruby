require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

$data = data[:items]

# use byebug to set a breakpoint
#byebug

# Write your solutions below
def count_all_shopping_products
    puts $data.select{|item| item[:kind] == 'shopping#product'}.length
end

def print_titles_of_backorders
    pp $data.select{|item| item[:product][:inventories][0][:availability] == 'backorder'}.map{|obj| obj[:product][:title]}
end

def print_titles_of_items_with_more_than_one_image
    pp $data.select{|item| item[:product][:images].length > 1}.map{|obj| obj[:product][:title]}
end

def find_products_by_brand(brand = 'Canon')
    pp $data.select{|item| item[:product][:brand].downcase == brand.downcase}
end

def print_brand_price_image_of_all_products
    pp $data.map{|obj| "brand: #{obj[:product][:brand]}, price: #{obj[:product][:inventories][0][:price]}, image: #{obj[:product][:images][0][:link]}"}
end
