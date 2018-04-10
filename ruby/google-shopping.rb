require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

# Write your solutions below
def get_items(obj)
  obj[:items]
end
items = get_items(data)

#1
def get_items_by_kind(items, kind)
  count = 0
  items.each do |item|
    if (item[:kind] == kind)
      count += 1
    end
  end
  return count
end
# pp get_items_by_kind(items, 'shopping#product')

#2
def get_available_items(items)
  items.select { |item|
    item[:product][:inventories].any? {|inventory|
      inventory[:availability] == 'backorder'
    }
  }
end
# pp get_available_items(items)

#3
def get_titles_w_multiple_links(items)
  items.select { |item| item[:product][:images].length > 1 }
end
# pp get_titles_w_multiple_links(items)

#4
def get_items_by_brand(items, brand)
  items.select { |item| item[:product][:brand].downcase == brand.downcase }
end
# pp get_items_by_brand(items, 'Canon')

#5
def get_items_by_brand_and_author(items, brand, author)
  items.select { |item| item[:product][:brand].downcase == brand.downcase && item[:product][:author][:name].downcase == author.downcase}
end
# pp get_items_by_brand_and_author(items, 'Canon', 'eBay')

#6
def get_brand_price_image_link(items)
  items.map { |item| "{ brand: #{item[:product][:brand]}, price: #{item[:product][:inventories][0][:price]}, image_link: #{item[:product][:images][0][:link]} }" }
end
# pp get_brand_price_image_link(items)