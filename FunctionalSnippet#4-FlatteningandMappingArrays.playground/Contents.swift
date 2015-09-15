infix operator >>= {}
func >>=<A, B>(xs: [A], f: A -> [B]) -> [B] {
    return xs.map(f).reduce([], combine: +)
}

let ranks = ["A", "K", "Q", "J", "10",
    "9", "8", "7", "6", "5",
    "4", "3", "2"]
let suits = ["♠", "♥", "♦", "♣"]

let allCards =  ranks >>= { rank in
    suits >>= { suit in [(rank, suit)] }
}

allCards.count
// Prints: [(A, ♠), (A, ♥), (A, ♦),
//          (A, ♣), (K, ♠), ...



let allCards1 = ranks.map{ rank in
    suits.map { suit in (rank, suit)}
}


allCards1[0]
