require_relative './data.rb'
data = DATA

data.map!(&:chars)

def scan_horizontal(data)
  count = 0

  data.each_with_index do |row, i|
    row.each_with_index do |char, j|
      next if j + 2 >= row.size || i + 2 >= data.size
      if char == 'M' && data[i][j + 2] == 'S'
        if data[i + 1][j + 1] == 'A'
          if data[i + 2][j] == 'M' && data[i + 2][j + 2] == 'S'
            count += 1
          end
        end
      end
    end
  end

  data.each_with_index do |row, i|
    row.each_with_index do |char, j|
      next if j + 2 >= row.size || i + 2 >= data.size
      if char == 'M' && data[i][j + 2] == 'M'
        if data[i + 1][j + 1] == 'A'
          if data[i + 2][j] == 'S' && data[i + 2][j + 2] == 'S'
            count += 1
          end
        end
      end
    end
  end

  data.each_with_index do |row, i|
    row.each_with_index do |char, j|
      next if j + 2 >= row.size || i + 2 >= data.size
      if char == 'S' && data[i][j + 2] == 'M'
        if data[i + 1][j + 1] == 'A'
          if data[i + 2][j] == 'S' && data[i + 2][j + 2] == 'M'
            count += 1
          end
        end
      end
    end
  end

  data.each_with_index do |row, i|
    row.each_with_index do |char, j|
      next if j + 2 >= row.size || i + 2 >= data.size
      if char == 'S' && data[i][j + 2] == 'S'
        if data[i + 1][j + 1] == 'A'
          if data[i + 2][j] == 'M' && data[i + 2][j + 2] == 'M'
            count += 1
          end
        end
      end
    end
  end
  count
end

count = 0

count += scan_horizontal(data)

p count
