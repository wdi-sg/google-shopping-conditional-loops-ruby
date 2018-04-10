require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})



# use byebug to set a breakpoint
#byebug

# Write your solutions below

#Qn 1
def count_kind (item_data)
      things = item_data[:items].select {|item| item[:kind] == "shopping#product"}
      things.size
end

# puts count_kind(data)
      
#Qn 2
def backordered_items (item_data)
      things = item_data[:items].select {|item| item[:product][:inventories][0][:availability] == "backorder"}
      things.map {|item2| item2[:product][:title]}
end

# puts backordered_items(data)

#Qn 3
def multiple_image_items (item_data)
      things = item_data[:items].select {|item| item[:product][:images].size > 1}
      things.map {|item2| item2[:product][:title]}
end

# puts multiple_image_items(data)

#Qn 4
def get_items_by_brand (items_data, brand)
      things = items_data[:items].select {|item| item[:product][:brand] == brand}
      things.map {|item2| item2[:product][:title]}
end

# puts get_items_by_brand(data, "Canon")

#Qn 5
def items_by_brand_author (items_data, brand, author)
      things = items_data[:items].select {|item| item[:product][:brand] == brand && item[:product][:author][:name] == author}
      things.map {|item2| item2[:product][:title]}
end

# puts items_by_brand_author(data, "Canon", "eBay")

#Qn 6
def all_products (items_data)
      items_data[:items].each do |item|
            puts item[:product][:title]
            puts item[:product][:brand]
            puts item[:product][:inventories][0][:price]
            puts item[:product][:images][0][:link]
      end
end

all_products(data)