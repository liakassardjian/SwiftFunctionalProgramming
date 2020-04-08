import Foundation
import PlaygroundSupport

func ordenaNomes(de frutas: [Fruta]) -> [String] {
    let nomesFrutas = frutas.map { $0.nome }
    return nomesFrutas.sorted(by: <)
}

print(ordenaNomes(de: frutas))

func emojis(de frutas: [Fruta]) -> [String] {
    return frutas.map { $0.emoji }
}

print(emojis(de: frutas))

func filtra(por cor: Cor) -> ([Fruta]) -> [Fruta] {
    return { frutas in
        frutas.filter { $0.cor == cor }
    }
}

let filtroVermelho = filtra(por: .vermelho)
print(emojis(de: filtroVermelho(frutas)))

func frutasComPesoAbaixoDe(_ peso: Double, frutas: [Fruta]) -> [Fruta] {
    return frutas.filter { $0.peso < peso }
}
print(emojis(de: frutasComPesoAbaixoDe(100, frutas: frutas)))

let frutasOrdenadas = frutas.quickSort()
print(emojis(de: frutasOrdenadas))

var frutasDeInteresse = [Fruta]()
for fruta in frutas where fruta.peso < 100 {
    if fruta.cor == .vermelho {
        frutasDeInteresse.append(fruta)
        break
    }
}

let frutasDeInteresseOrdenadas1 = frutasDeInteresse.quickSort()
print(emojis(de: frutasDeInteresseOrdenadas1))

let frutasDeInteresseOrdenadas2 = frutas
    .filter { $0.cor == .vermelho && $0.peso < 100 }
    .sorted(by: <)
print(emojis(de: frutasDeInteresseOrdenadas2))

func pesoSaladaDeFrutas(com frutas: [Fruta]) -> Double {
    return frutas.reduce(0) { (total, fruta) in
        total + fruta.peso
    }
}
print(pesoSaladaDeFrutas(com: frutas))
