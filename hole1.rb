def calculate_number_string(value)
  value.to_s.split('').reverse.each_with_index.map do |b, index|
    {'10' => ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'][b.to_i], '20' => value.to_s[0] == '1' ? ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'][b.to_i] :  value.to_s[0] == '0' ? nil : ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'][b.to_i], '21' => value.to_s[0] == '1' ? nil : [nil, 'ten', 'twenty', 'thirty', 'fourty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'][b.to_i],'30' => ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'][b.to_i],'31' => [nil, nil, 'twenty', 'thirty', 'fourty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'][b.to_i],'32' => "#{[nil, 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'][b.to_i]} hundred #{value.to_s[2].to_i > 0 ? 'and' : ''}",'40' => 'one thousand',}["#{value.to_s.length}#{index}"] unless  b == '0' && index == 0 && value.to_s.length > 1 && value.to_s.length < 4 && value.to_s != '10' || value.to_s.length == 4 && index > 0
  end.reverse.compact.join(' ')
end

puts 'Enter a number between 1 and 1,000:'
value = gets.to_i
puts '--------------'
puts calculate_number_string(value)

