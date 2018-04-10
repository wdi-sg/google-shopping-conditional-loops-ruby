require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

#1
puts "Objective 1: "
$x = 0
data[:items].each do |item|
  	if item[:kind] == "shopping#product"
  		$x += 1	
  	end
end
puts "There are #{$x} shopping products"

#2
puts " "
puts "Objective 2: Print title of backordered items"
data[:items].each do |item|
  	if item[:product][:inventories][0][:availability] == "backorder"
  		puts item[:product][:title]
  	end
end

#3
puts " "
puts "Objective 3: Print title of items with more than 1 image link"
data[:items].each do |item|
  	if item[:product][:images].length > 1
  		puts item[:product][:title]
  	end
end

#4
puts " "
puts "Objective 4: Print title of Canon product items"
data[:items].each do |item|
  	if item[:product][:brand].downcase == "canon"
  		puts item[:product][:title]
  	end
end

#5
puts " "
puts "Objective 5: Print title of Canon product items and Author name of eBay"
data[:items].each do |item|
  	name = item[:product][:author][:name]
  	if item[:product][:brand].downcase == "canon" && name[0,4] == "eBay"
  		puts item[:product][:title]
  	end
end

#6
puts " "
puts "Objective 6: Print all products with brand, price and an image link"
data[:items].each do |item|
	brand = item[:product][:brand]
	price = item[:product][:inventories][0][:price]
	imglink = item[:product][:images][0][:link]
  	puts "Brand: #{brand} - Price: #{price} - Image Link: #{imglink}"
end

#pp data

# use byebug to set a breakpoint
#byebug
