require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# use byebug to set a breakpoint
# byebug

# Write your solutions below

# qn 1 - find items with kind=shopping#product
def count_kind(input)
    list = input[:items].select {|item| item[:kind] == "shopping#product"}
    list.size
end
# puts count_kind(data)

# qn 2 - find title whose inventories=backorder
def show_backorder_title(input)
    list = input[:items].select {|item| item[:product][:inventories][0][:availability] == "backorder"}
    answer = list.map {|ans| ans[:product][:title]}
end
# puts show_backorder_title(data)

# qn 3 - find title with more than 1 image link
def show_image_title(input)
    list = input[:items].select {|item| item[:product][:images].length > 1}
    answer = list.map {|ans| ans[:product][:title]}
end
# puts show_image_title(data)

# qn 4 - find title whose brand is Canon
def show_canon(input)
    list = input[:items].select {|item| item[:product][:brand] == "Canon"}
    answer = list.map {|ans| ans[:product][:title]}
end
# puts show_canon(data)

# qn 5 - find title whose auther is eBay and brand is Canon
def show_eBay_canon(input)
    list = input[:items].select {|item| item[:product][:author][:name] == "eBay" && item[:product][:brand] == "Canon"}
    answer = list.map {|ans| ans[:product][:title]}
end
# puts show_eBay_canon(data)

#qn 6 - find all brand, price and image link
def show_brand_price_image(input)
    list = input[:items]
    answer = list.map {|ans| "Title: #{ans[:product][:title]}, Brand: #{ans[:product][:brand]}, Price: #{ans[:product][:inventories][0][:price]}, Link: #{ans[:product][:images][0][:link]}"}
end
# puts show_brand_price_image(data)
