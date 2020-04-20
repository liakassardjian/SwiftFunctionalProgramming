import Foundation

/**
 Enumerador das cores possíveis para as frutas.
 */
public enum Cor: String {
    case vermelho
    case laranja
    case amarelo
    case verde
    case roxo
}

/**
 Struct que representa uma fruta.
 */
public struct Fruta {
    public let nome: String
    public let emoji: String
    public let cor: Cor
    public let peso: Double
}

/**
 Vetor de frutas.
 */

public let frutas = [
    Fruta(nome: "Maçã", emoji: "🍎", cor: .vermelho, peso: 110),
    Fruta(nome: "Maçã", emoji: "🍏", cor: .verde, peso: 110),
    Fruta(nome: "Laranja", emoji: "🍊", cor: .laranja, peso: 150),
    Fruta(nome: "Maracujá", emoji: "🍋", cor: .amarelo, peso: 90),
    Fruta(nome: "Banana", emoji: "🍌", cor: .amarelo, peso: 85),
    Fruta(nome: "Uva", emoji: "🍇", cor: .roxo, peso: 5),
    Fruta(nome: "Morango", emoji: "🍓", cor: .vermelho, peso: 30),
    Fruta(nome: "Pêssego", emoji: "🍑", cor: .laranja, peso: 130),
    Fruta(nome: "Kiwi", emoji: "🥝", cor: .verde, peso: 95)
]

/**
 Extensão de Fruta que define as funções de menor e comparação.
 */
extension Fruta: Comparable {
    public static func <(lhs: Fruta, rhs: Fruta) -> Bool {
        return lhs.peso < rhs.peso
    }
    
    public static func ==(lhs: Fruta, rhs: Fruta) -> Bool {
        return lhs.peso == rhs.peso
    }
}

/**
 Extensão de Array de elementos comparáveis que implementa um QuickSort sobre o vetor.
 */
extension Array where Element: Comparable {
    public func quickSort() -> [Element] {
        if self.count > 1 {
            let (pivot, remaining) = (self[0], dropFirst())
            let lhs = remaining.filter { $0 <= pivot }
            let rhs = remaining.filter { $0 > pivot }
            return lhs.quickSort() + [pivot] + rhs.quickSort()
        }
        return self
    }
}
