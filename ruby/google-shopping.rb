require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data
# use byebug to set a breakpoint
#byebug

# Write your solutions below

# Qn1
# x=0
# data[:items].each do |key|
# 	if key[:kind]=="shopping#product"
# 		x+=1
# 	end
# end
# puts x

# Qn2 Print the `title` of all items with a `backorder` availability in `inventories`.

# data[:items].each do |item|
# 	if 	pp item[:product][:inventories][0][:availability]="backorder"
# 		puts item [:product][:title]
# 	end
# end

# 3.) Print the `title` of all items with more than one image link.

# data[:items].each do |item|
# 	if item[:product][:images].length > 0
# 	 	pp item[:product][:title]
# 	end
# end

# 4.) Print all `items` that have an author name of "eBay" and are brand "Canon".

data[:items].each do |item|
	if item[:product][:brand].downcase=="canon" && item[:product][:brand]="eBay"
	 	pp item[:product][:title]
	end
end