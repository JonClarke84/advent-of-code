require_relative './data.rb'
data = DATA
# data = [
# 'MMMSXXMASM',
# 'MSAMXMSMSA',
# 'AMXSXMAAMM',
# 'MSAMASMSMX',
# 'XMASAMXAMM',
# 'XXAMMXXAMA',
# 'SMSMSASXSS',
# 'SAXAMASAAA',
# 'MAMMMXMMMM',
# 'MXMXAXMASX'
# ]

count = 0

def find_xmas_in_x(data)
  found_xmases = 0
  data.each do |line|
    line.scan(/XMAS/).each do |match|
      found_xmases += 1
    end
    line.reverse.scan(/XMAS/).each do |match|
      found_xmases += 1
    end
  end
  found_xmases
end

def rotate_data_90(data)
  data_as_array = data.map { |line| line.split('') }
  data_as_array.transpose.map(&:join)
end

def rotate_45(array)
  array = array.map { |line| line.split('') }
  rotated = Hash.new { |h, k| h[k] = [] }
  array.each_with_index do |row, i|
    row.each_with_index do |value, j|
      rotated[i + j] << value
    end
  end
  rotated.values.map(&:join)
end

def rotate_minus_45(array)
  array = array.map { |line| line.split('') }
  rotated = Hash.new { |h, k| h[k] = [] }
  array.each_with_index do |row, i|
    row.each_with_index do |value, j|
      rotated[i - j] << value
    end
  end
  rotated.values.map(&:join)
end

# original
count += find_xmas_in_x(data)

# 45 degrees
rotated_45 = rotate_45(data)
count += find_xmas_in_x(rotated_45)

# 90 degrees
rotated_90 = rotate_data_90(data)
count += find_xmas_in_x(rotated_90)

# -45 degrees
rotated_minus_45 = rotate_minus_45(data)
count += find_xmas_in_x(rotated_minus_45)

p count
