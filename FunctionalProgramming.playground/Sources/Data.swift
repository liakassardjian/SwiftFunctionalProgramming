import Foundation

public enum Cor: String {
    case vermelho
    case laranja
    case amarelo
    case verde
    case roxo
}

public struct Fruta {
    public let nome: String
    public let emoji: String
    public let cor: Cor
    public let peso: Double
}


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

extension Fruta: Comparable {
    public static func <(lhs: Fruta, rhs: Fruta) -> Bool {
        return lhs.peso < rhs.peso
    }
    
    public static func ==(lhs: Fruta, rhs: Fruta) -> Bool {
        return lhs.peso == rhs.peso
    }
}

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
