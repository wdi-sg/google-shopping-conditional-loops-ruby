require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

items = data[:items]
pp data

# use byebug to set a breakpoint
#byebug

# Write your solutions below

q1_result = []
items.each do |item|
    if item[:kind] == "shopping#product"
        q1_result.push(item)
    end
end
pp q1_result.length

q2_result = []
items.each do |item|
    if item[:product][:inventories][0][:availability] == "backorder"
        q2_result.push(item)
    end
end
pp q2_result.map{|backorder_item| backorder_item[:product][:title]}

q3_result = []
items.each do |item|
    if item[:product][:images].length > 1
        q3_result.push(item)
    end
end
pp q3_result.map{|more_than_one_image| more_than_one_image[:product][:title]}

q4_result = []
items.each do |item|
    if item[:product][:brand] == "Canon"
        q4_result.push(item)
    end
end
pp q4_result

q5_result = []
q4_result.each do |item|
    if item[:product][:author][:name].include? "eBay"
        q5_result.push(item)
    end
end
pp q5_result

q6_result = []
items.each {|item| q6_result.push ({
    :brand => item[:product][:brand]
    :price => item[:product][:inventories][0][:price]
    :image => item[:product][:images]
})}

pp q6_result





# def count_all_shopping_products
#    puts $data.select{|item| item[:kind] == 'shopping#product'}.length
# end

# byebug

# def print_titles_of_backorders
#    pp $data.select{|item| item[:product][:inventories][0][:availability] == 'backorder'}.map{|obj| obj[:product][:title]}
# end

# def print_titles_of_items_with_more_than_one_image
#    pp $data.select{|item| item[:product][:images].length > 1}.map{|obj| obj[:product][:title]}
# end

# def find_products_by_brand(brand = 'Canon')
#    pp $data.select{|item| item[:product][:brand].downcase == brand.downcase}
# end

# def print_brand_price_image_of_all_products
#    pp $data.map{|obj| "brand: #{obj[:product][:brand]}, price: #{obj[:product][:inventories][0][:price]}, image: #{obj[:product][:images][0][:link]}"}
# end

