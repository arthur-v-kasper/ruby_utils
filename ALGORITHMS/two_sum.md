https://leetcode.com/problems/two-sum/?envType=study-plan-v2&envId=top-interview-150

Given an array of integers "nums" and an integer "target", return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.

```ruby
def two_sum(nums, target)
  hash = {}

  nums.each_with_index do |num, index|
    puts "Valor num é #{num} e do index é #{index}"
    puts "Valor da chave hash[#{num}] contém o valor: #{hash[num]}"
    puts ""

    return [hash[num], index] if hash.has_key?(num)

    hash[target-num] = index

    puts "Valor targer: #{target} e do num: #{num}, que irá receber o indice #{index} na chave do hash"
    puts "Então hash[target-num] é #{target-num} que conterá o indice #{hash[target-num]}"
    puts ""
  end
end

puts "Result #{two_sum([2,5,7,8,10], 12)}"
```

## Explicação do algorítmo

return [hash[num], index] if hash.has_key?(num)

Aqui vc armazena o indice na posição do valor do target menos o valor atual do array
O que significa, que na próxima iteração, se o valor do elemento do array existir, que seria o `hash.has_key?(num)` ele é o valor que somado vai ser igual ao target
Exemplo

array [2,5,7,8,10], target 12

primeira iteracao, 12 menos 2, vai ser 10
na segunda iteraçao do loop, é conferido se o valor corrente que é 5, existe no hash