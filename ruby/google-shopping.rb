require 'byebug'
require 'json'
require 'pp'


file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})[:items]

# use byebug to set a breakpoint
#byebug

# Write your solutions below
def getCount(data)
  count = 0
  data.each do |item|
    next unless item[:kind] == "shopping#product"
    count += 1
  end
  puts "there are #{count} 'shopping#product' tags"
end

def backOrder(data)
  data.each do |item|
    item[:product][:inventories].each do |i|
      next unless i[:availability] == "backorder"
      puts "BACKORDER ITEM: #{item[:product][:title]}"
      break
    end
  end
end

def moreThanOneImage(data)
  data.each do |item|
    count = 0
    item[:product][:images].each do |image|
      count += 1
      if count > 1
        puts "MUTLIPLE IMAGES: #{item[:product][:title]}"
        break
      end
    end
  end
end

def getByBrand(data, brand)
  brand.downcase!
  data.select { |item|  item[:product][:brand].downcase.include? brand }
end

def getByAuthor(data, author)
  author.downcase!
  data.select { |item|  item[:product][:author][:name].downcase.include? author }
end

def printBrandPriceImage(data)
  data.each do |item|
    puts item[:product][:brand]
    puts item[:product][:inventories][0][:price]
    puts item[:product][:images][0][:link]
    puts "--------"
  end
end


getCount(data)
backOrder(data)
moreThanOneImage(data)
branded = getByBrand(data, "CANON")
brandAndAuthor = getByAuthor(branded, "eBay")
pp brandAndAuthor
printBrandPriceImage(data)
