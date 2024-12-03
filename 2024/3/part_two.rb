data = IO.read('data.txt')
pattern = /mul\((\d+),(\d+)\)/

def remove_all_sections_between_dont_and_do(string)
  string.gsub(/don't\(\).*?do\(\)/m, '')
end


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

clean_data = remove_all_sections_between_dont_and_do(data)

patterns = extract_string_pattern(clean_data, pattern)

p multiply_numbers(patterns).sum
