require 'json'

data = JSON.parse(File.read('data.json'))
a = data['a'].sort
b = data['b'].sort

c = a.each_with_index.map do |x, i|
  (x - b[i]).abs
end.sum

puts c
