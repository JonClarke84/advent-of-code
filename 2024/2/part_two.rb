require_relative 'data.rb'
data = DATA

safe_rows = { count: 0 }

def check_each_element(row, safe_rows)
  row.each_with_index do |element, index|
    row.delete_at(index)
    if is_valid?(row)
      safe_rows[:count] += 1
      return
    else
      row.insert(index, element)
    end
  end
end

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
      safe_rows[:count] += 1
    else
      check_each_element(row, safe_rows)
    end
  end
  puts safe_rows
end

find_safe_rows(data, safe_rows)
