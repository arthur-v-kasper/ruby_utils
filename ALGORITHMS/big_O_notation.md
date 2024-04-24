# Explanation

Big O Notation serve para descrever a complexidade temporal e espacial de um algorítmo.
A leta `O` poderia ser traduzida ou pensada como `Em ordem de...` ou `Complexidade de...`

### Temporal

Quanto tempo demorará para executar o algorítmo proporcionalmente ao input do mesmo
Por exemplo, se a entrada deste algorítmo for um ARRAY e a gente percorrer TODOS os itens deste array uma vez
será um `Big O(n)`, ou seja o tempo que demorará para executar será proporcional a entrada do input

### Espacial

O quanto de memórial precisamos alocar para executar este algorítmo, que vai variar com a quantidade de itens que precisamos
encontrar numa determinada lista, por exemplo, se precisarmos achar 3 itens num array, isso será um `O(3)`, pois não importa o
tamanho do array, sempre alocaremos apenas 3 itens na memória.

## Tipos de Big O Notation

### Constant Time

Quando o tempo será sempre o mesmo, independente o tamanho do input.
Por exemplo, se eu precisar buscar o primeiro ou o último item de um array, o tempo sempre será o mesmo, independente do quao grande seja esse array

Este tipo é representado por `O(1)`

### Logarithmic time

Conforme o tamanho do input aumenta em `n` o tempo de execução aumenta em `log n`, que significa que é um aumento logarítmo, não lineal
O input cresce de maneira mais rápida que o tempo de execução.
Um exemplo disso é quando usado busca binária, onde mesmo o input aumentando muito mais que o tempo de exeução.
(Explicação bem didática e facil de entender aqui com mais detalhes)[https://youtu.be/3mwnw3XsEH4?t=109]

Este tipo é representado por `O(log n)`

### Linear time

Conforme o input aumenta, o tempo de execução aumenta linearmente.
Por exemplo, é necessário achar o maior número dentro de um array, vc obrigatóriamente precisará percorrer todos os itens do array
Se o array possuir 5 posições demorará 1, se possuir 25, vai demorar 5 e assim sucessivamente

Este tipo é representado por `O(n)`

## Linearithmic time

Tipo um pouco mais complexo, utilizado no algorítmo MergeSort.
Trabalha utilizando tanto `O(log n)` quanto `O(n)`

Este tipo é representado por `O(n log n)`

## Quadratic time

Basicamente quando você possui um loop dentro de um loop, o que vai acarretar numa demora ao quadrado.
Por exemplo, se vc precisa fazer uma busca dentro de um único array para achar os duplas dos números, precisará percorrer todos os itens para cada item existente.
(Explicação meio confusa, revisitar esta notação)

Este tipo é representado por `O(n^2)`

## Exponential time
A cada novo elemento o tempo vai dobrando.

Este tipo é representado por `O(2^n)`

## Factorial time
O tempo de execução aumenta fatorialmente com o tamanho do input, este caso escala muito mal (pior de todos)
Por exemplo: gerar todas as permutações de um array

*Dado o array*
| 1 | 2 |
Permutações: 1 - 2 - 12 - 21

*Dado o array*
| 1 | 2 | 3 |
Permutações: 1 - 2 - 3 - 12 - 21 - 13 - 31 - 23 - 32 - 123 - 321 - 231 .......

Este tipo é representado por `O(n!)`