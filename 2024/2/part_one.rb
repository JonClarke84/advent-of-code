require_relative 'data.rb'
data = DATA

safe_rows = 0

def is_valid?(row)
  ascending = true
  descending = true

  row.each_cons(2) do |a, b|
    diff = (a - b).abs

    return false if diff > 3

    if a < b
      descending = false
    elsif a > b
      ascending = false
    else
      ascending = false
      descending = false
    end
  end

  return false unless ascending || descending

  true
end

def find_safe_rows(data, safe_rows)
  data.each do |row|
    if is_valid?(row)
      safe_rows += 1
    end
  end
  puts safe_rows
end

find_safe_rows(data, safe_rows)
