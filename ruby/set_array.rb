require 'benchmark/ips'
require 'set'

puts 'creating a new'

Benchmark.ips(10) do |x|
  x.report('array')         { ['application/pdf', 'application/octet-stream', 'application/x-pdf'] }
  x.report('set')  { Set['application/pdf', 'application/octet-stream', 'application/x-pdf'] }

  x.compare!
end

puts
puts 'include?'

array = ['application/pdf', 'application/octet-stream', 'application/x-pdf', 'binary/octet-stream', 'image/jpeg']
array_frozen = array.freeze
set = Set['application/pdf', 'application/octet-stream', 'application/x-pdf', 'binary/octet-stream', 'image/jpeg']
set_frozen = set.freeze

missing_element = 'no such element'

Benchmark.ips(10) do |x|
  x.report('array')         { array.include?(missing_element) }
  x.report('frozen array')         { array_frozen.include?(missing_element) }
  x.report('set')  { set.include?(missing_element) }
  x.report('frozen set')  { set_frozen.include?(missing_element) }

  x.compare!
end

existing_element = 'application/pdf'

Benchmark.ips(10) do |x|
  x.report('array')         { array.include?(existing_element) }
  x.report('frozen array')         { array_frozen.include?(existing_element) }
  x.report('set')  { set.include?(existing_element) }
  x.report('frozen set')  { set_frozen.include?(existing_element) }

  x.compare!
end
