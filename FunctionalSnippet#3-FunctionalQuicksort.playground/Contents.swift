extension Array {
    var decompose : (head: T, tail: [T])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }
}

func qsort(input: [Int]) -> [Int] {
    if let (pivot, rest) = input.decompose {
        let lesser = rest.filter { $0 < pivot }
        let greater = rest.filter { $0 >= pivot }
        return qsort(lesser) + [pivot] + qsort(greater)
    } else {
        return []
    }
}

var input: [Int] = [1, 2, 3, 7, 4]
var result = qsort(input)
result

let temp = input

input.sort{
    return $0 < $1
}
//do something with sorted array
//...

//put to original array
input = temp
result
input
