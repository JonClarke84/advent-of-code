require 'json'

data = JSON.parse(File.read('data.json'))
a = data['a'].to_set
b = data['b']

total_count = b.sum { |item| a.include?(item) ? item : 0 }

puts total_count
