data = IO.read('data.txt')

pattern = /mul\((\d+),(\d+)\)/

def extract_string_pattern(string, pattern)
  patterns = []
  string.scan(/#{pattern}/) do |match|
    match = match.map { |a| a.to_i }
    patterns << match
  end
  return patterns
end

def multiply_numbers(array)
  array.map { |a| a.inject(:*) }
end


patterns = extract_string_pattern(data, pattern)

p multiply_numbers(patterns).sum
