/*:
 # Programação Funcional em Swift
 */

import Foundation
import PlaygroundSupport

/*:
 A  função `emojis` utiliza a função `map` para retornar um vetor de Strings contendo os emojis das frutas.
 Execute a linha com o print para ver o vetor de emojis de todas as frutas.
 */
func emojis(de frutas: [Fruta]) -> [String] {
    return frutas.map { $0.emoji }
}

print(emojis(de: frutas))

/*:
 A  função `ordenaNomes` utiliza as funções `map` e `sorted` para retornar um vetor de Strings contendo os nomes das frutas ordenados crescentemente.
 Execute a linha com o print para ver o vetor com os nomes ordenados.
 */
func ordenaNomes(de frutas: [Fruta]) -> [String] {
    let nomesFrutas = frutas.map { $0.nome }
    return nomesFrutas.sorted(by: <)
}

print(ordenaNomes(de: frutas))

/*:
 A  função `filtra` utiliza a função `filter` para retornar um vetor de frutas que contenha apenas frutas de uma cor definida.
 Ao aplicar o `filtroVermelho` no vetor `frutas`, é retornado um vetor contendo apenas frutas vermelhas.
 Execute a linha com o print para ver o vetor de frutas vermelhas.
 */
func filtra(por cor: Cor) -> ([Fruta]) -> [Fruta] {
    return { frutas in
        frutas.filter { $0.cor == cor }
    }
}

let filtroVermelho = filtra(por: .vermelho)
print(emojis(de: filtroVermelho(frutas)))

/*:
 A função `frutasComPesoAbaixoDe` utiliza a função `filter` para retornar um vetor cujas frutas pesam menos que o peso passado como parâmetro.
 Execute a linha com o print para ver o vetor de frutas que pesam menos que 100g.
 */
func frutasComPesoAbaixoDe(_ peso: Double, frutas: [Fruta]) -> [Fruta] {
    return frutas.filter { $0.peso < peso }
}

print(emojis(de: frutasComPesoAbaixoDe(100, frutas: frutas)))

/*:
 A função `pesoSaladaDeFrutas` utiliza a função `reduce` para Double equivalente à soma do peso de todas as frutas que forem passadas como parâmetro.
 Execute a linha com o print para ver quanto pesa uma salada de frutas.
 */
func pesoSaladaDeFrutas(com frutas: [Fruta]) -> Double {
    return frutas.reduce(0) { (total, fruta) in
        total + fruta.peso
    }
}

print(pesoSaladaDeFrutas(com: frutas))

/*:
 A função `frutasOrdenadas` utiliza a função `quickSort`, criada no arquivo Data, para ordenar as frutas utilizando o algoritmo do Quick Sort. Para que essa implementação fosse possível, foi necessário definir funções de menor e de comparação para o tipo Fruta, de modo que frutas pudessem ser comparadas através de `<=`. Na definição, ao aplicar as funções `<` ou `==` a duas frutas, o resultado é definido por quanto cada uma delas pesa.
 Execute a linha com o print para ver o vetor de frutas ordenado por peso.
 */
let frutasOrdenadas = frutas.quickSort()
print(emojis(de: frutasOrdenadas))

/*:
 Agora, uma comparação entre programação imperativa e declarativa. E se quiséssemos definir um conjunto de frutas que pesassem menos que 100g e fossem vermelhas?
 
 Isso poderia ser feito através de um `for` e de um conjunto de `if`s, como mostra o seguinte trecho de código.
 Ao executar a linha com o print, pode ser observado esse conjunto de frutas.
 */
var frutasDeInteresse = [Fruta]()
for fruta in frutas {
    if fruta.peso < 100,
        fruta.cor == .vermelho {
        frutasDeInteresse.append(fruta)
    }
}

let frutasDeInteresseOrdenadas1 = frutasDeInteresse.quickSort()
print(emojis(de: frutasDeInteresseOrdenadas1))

/*:
 Porém, como seria possível construir esse trecho de código usando Programação Funcional?
 Poderíamos aplicar um filtro por cor vermelha e peso e, em seguida, ordenar pelo operador que já foi definido anteriormente, o `<`.
 Ao executar a linha com o print, pode ser observado o mesmo conjunto de frutas, mas agora usando Programação Funcional.
 */
let frutasDeInteresseOrdenadas2 = frutas
    .filter { $0.cor == .vermelho && $0.peso < 100 }
    .sorted(by: <)
print(emojis(de: frutasDeInteresseOrdenadas2))


