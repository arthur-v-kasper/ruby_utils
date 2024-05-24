books = [
  { name: 'Lord of the Rings', rating: 5, category: 'Fantasy' },
  { name: 'Harry Potter', rating: 4, category: 'Fantasy' },
  { name: 'Call of Cthulhu', rating: 5, category: 'Cosmic Horror' },
]

# Avarege of the books

# OBS: books.reduce(0) is to start the value of sum with 0, how we are interated trought an array
# of hash, it is necessary, because without his the "sum" will initiate with the value of the hash
# and when it try to run "sum += book[:rating]" it will raise an error
avg = books.reduce(0) { |sum, book| sum += book[:rating] } / books.length
puts "The Average of rating is: #{avg}\n"

# Here is easy to see why the code will break if it not initiate with 0
# avg = books.reduce do |sum, book| 
#   puts "sum: #{sum}"
#   # sum += book[:rating]
# end

# Filter elements with category: 'Fantasy'
fantasy_books = books.select { |book| book[:category] == 'Fantasy' }
puts "fantasy_books: #{fantasy_books}\n"

books.push({ name: 'The Colour Out of Space', rating: 3, category: 'Cosmic Horror' })
puts books

# Generate new array with name modification
books_new_description = books.map do |book|
  book[:name] += " (#{book[:category]})"
  book
end

puts books_new_description

# copy the object and change only the copy
books.push({ name: '1984', rating: 5, category: {id: 2, name: 'Fiction' } })

# To understand the Marshal.load(Marshal.dump(books)) copy, look the explanation in hash.rb file
copy_books = Marshal.load(Marshal.dump(books))
books.last[:category][:id] = 1
puts books.last[:category][:id]
puts copy_books.last[:category][:id]
