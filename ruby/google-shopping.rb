require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file)

pp data

# use byebug to set a breakpoint
#byebug

# Write your solutions below
