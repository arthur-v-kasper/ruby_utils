# Both are anonymous Function

# diferences between Procs vs Lambdas
# with Procs you can pass a wrong number of arguments

# with Lambda you have to use the exactly number or arguments, if you do not, lambda will raise an error, the same way if you do not pass a argument when the lambda has one.
# its recommended if you want yo strictly enforce rules

my_proc = proc { |a, b, c| a + b }
puts my_proc.call(3,9,7,8,9) 
puts my_proc.call(2,9) # in this case "c" is assignment as nil
# even if I pass 2 arguments, it works

my_lambda = -> (a, b) { a + b }
puts my_lambda.call(2,10)
# my_lambda.call(2,9,1) # raise an error

## Using yield with block proc

def sum_numbers
  puts "\nRun sum_numbers..."

  yield 1, 2, 4
end

# when you call the method, pass a block through the method
puts sum_numbers { |a, b| a + b }
