require 'benchmark/ips'
require 'set'

array = %w{
  application/vnd.ms-excel
  application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
  application/vnd.ms-powerpoint
  application/vnd.openxmlformats-officedocument.presentationml.presentation
  application/pdf
  application/msword
  application/vnd.openxmlformats-officedocument.wordprocessingml.document
  text/plain
  application/rtf
  image/jpeg
}

array_symbols = Array.new(array.map(&:to_sym))
set = Set.new(array)
set_symbols = Set.new(array_symbols)

missing_element = 'no such element'
missing_element_sym = missing_element.to_sym

puts
puts 'miss'
puts

Benchmark.ips do |x|
  x.report('array') { array.include?(missing_element) }
  x.report('array symbols') { array_symbols.include?(missing_element_sym) }

  x.compare!
end

existing_element = 'application/pdf'
existing_element_sym = existing_element.to_sym

puts
puts 'hit'
puts

Benchmark.ips do |x|
  x.report('array') { array.include?(existing_element) }
  x.report('array symbols') { array_symbols.include?(existing_element_sym) }

  x.compare!
end