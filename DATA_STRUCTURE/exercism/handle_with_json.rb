require 'json'

## Read  File
file = File.open('config.json')

# as string
content = file.read
puts content
puts

# convert to ruby hash
data = JSON.parse(content)

puts data['max_length']
puts data['sources'][0]['source']

## Write  File

hash = {
  people: [
    { first_name: "Arthur", last_name: "Kasper" },
    { first_name: "Darcísio", last_name: "Kasper" },
    { first_name: "Brigita", last_name: "Kasper" },
  ]
}

# don't forguet to use .to_json =)
File.write('people.json', hash.to_json)