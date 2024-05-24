require 'csv'

## Read File ##
books_file = File.open("books.csv")
# read the document like an string
content = books_file.read
puts content
puts #{content.class}
puts

# Parse the data
parse_data = CSV.parse(content)
p parse_data
puts

# avoid to show the header of CSV, it's possible to use parse_data.drop(1).each too
# tecnically parse_data.drop(1).each will return a new array without the first row
parse_data.each_with_index do |row, index|
  next if index == 0
  puts "ID: #{row[0]} / Name: #{row[1]} / Rating: #{row[2]}"
end


## Write File ##

# First option: using just ruby
list_of_employees = [
  [1, "Jonh", "Doe", "000001"],
  [2, "Mark", "Cash", "000021"],
  [3, "Stu", "Star", "000011"]
]

puts data = list_of_employees.map { |employee| employee.join(",") }.join("\n")

File.write('employees.csv', data)

# Secound option (and easiest): using CSV library
CSV.open('employees_two.csv', 'w') do |csv|
  list_of_employees.each { |row| csv << row }
end