require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

pp data

# use byebug to set a breakpoint
#byebug

# Write your solutions below
