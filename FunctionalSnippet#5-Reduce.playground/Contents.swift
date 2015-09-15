let sum: [Int] -> Int = { $0.reduce(0, combine: +) }

let numbers: [Int] = [1, 2, 3]
sum(numbers)

let product: [Int] -> Int = { $0.reduce(1, combine: *) }

product(numbers)

let all: [Bool] -> Bool = { $0.reduce(true, combine: { $0 && $1 }) }

let bools: [Bool] = [true, false, true]

all(bools)


