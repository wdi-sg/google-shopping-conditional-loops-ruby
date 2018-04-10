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
