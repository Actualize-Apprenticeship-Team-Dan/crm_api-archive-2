# def fizzbuzz
#   101.times do |number|
#     if number % 3 == 0 && number % 5 == 0
#       puts "fizzbuzz"
#     elsif number % 3 == 0
#       puts "fizz"
#     elsif number % 5 == 0
#       puts "buzz"
#     else
#       puts number
#     end
#   end
# end

def the_interview
  (1..100).each{ |n| puts n % 15 == 0 ? "fizzbuzz" : n % 3 == 0 ? "fizz" : n % 5 == 0 ? "buzz" : n }
  (0..99).reverse_each{|n| puts "I have #{n} bottles."}
end
the_interview


