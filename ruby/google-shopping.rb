require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

#pp data

# use byebug to set a breakpoint
#byebug

# Write your solutions below

###
### QUESTION 1
###
items = data[:items]
count = 0
items.each do |item|
  count += 1 if item[:kind] == 'shopping#product' 
end
pp count

###
### QUESTION 2
###
items = data[:items]
items.each do |item|
  if item[:product][:inventories][0][:availability] == 'backorder'
    pp item[:product][:title] 
  end
end

###
### QUESTION 3
###
items = data[:items]
items.each do |item|
  if item[:product][:images].length > 2
    pp item[:product][:title]
  end
end

###
### QUESTION 4
###
items = data[:items]
items.each do |item|
  if item[:product][:brand] == 'Canon'
    pp item[:product][:title]
  end
end

###
### QUESTION 5
###
items = data[:items]
items.each do |item|
  if item[:product][:brand] == 'Canon' && item[:product][:author][:name] == 'eBay'
    pp item[:product][:title]
  end
end

###
### QUESTION 6
###
items = data[:items]
items.each do |item|
  pp item[:product][:title]
  pp item[:product][:brand]
  pp item[:product][:inventories][0][:price]
  pp item[:product][:link]
end
