person = {
  first_name: 'Arthur',
  last_name: 'Kasper',
  address: { country: 'Germany' }
}

puts "person.has_key?(:first_name): #{person.has_key?(:first_name)}"
puts "person.has_value?('Kasper'): #{person.has_value?('Kasper')}"
puts "person.has_key?('first_name'): #{person.has_key?('first_name')}"

# O has_key? apenas funciona no nó corrente, para atributos nestados não
puts "person.has_key?(:coutry): #{person.has_key?(:coutry)}"
puts "person[:address].has_key?(:coutry): #{person[:address].has_key?(:coutry)}"

# Você pode usar o member tbm
puts "person.member?(:first_name): #{person.member?(:first_name)}"
puts "person[:address].member?(:first_name): #{person[:address].member?(:coutry)}\n"

### Pass by reference ###
another_person = person
another_person[:first_name] = 'Mark'

puts person[:first_name]
puts another_person[:first_name]

person[:first_name] = 'Arthur'
puts person[:first_name]
puts another_person[:first_name]
# Estranho, certo?
# isto ocorreu pq quando atribuímos "another_person = person" na verdade estamos passando o 
# objeto como referência na memória, então ambos estão apontando para o mesmo valor

# Se realmente quisermos criar uma copia do objeto precisamos usar o dup, tbm é chamado de "shallow copy"
copy_person = person.dup
copy_person[:first_name] = 'Jack'

puts person[:first_name]
puts copy_person[:first_name]
puts

# Porém o "dup" ou "shallow copy" apenas copia o nó filho, mas não os demais nestados, vc pode ver o problema desta cópia rasa no exemplo abaixo:
# perceba que para itens nestados ainda existe a referência em memória
# copy_person = person.dup
# copy_person[:address][:country] = 'Brazil'
# puts person[:address][:country] # 'Brazil'
# puts

# Então se vc realmente quiser copiar o objeto inteiro, vc precisa usar o "Deep Copy", usando o Marshal.load() e Marshal.dump()

copy_person = Marshal.load( Marshal.dump(person))
copy_person[:address][:country] = 'Brazil'
puts copy_person[:address][:country]
puts person[:address][:country]