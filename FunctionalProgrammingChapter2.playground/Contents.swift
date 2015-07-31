

func computeInArray(xs: [Int], f: Int -> Int) -> [Int]
{
    var result: [Int] = []
    for x in xs
    {
        result.append(f(x))
    }
    return result
}

func doubleArray2(xs: [Int]) -> [Int]
{
    return computeInArray(xs) { x in x * 2 }
}


var input: [Int] = [1, 2, 3, 5]
//doubleArray2(input)


func genericComputeArray<U>(xs: [Int], f: Int -> U) -> [U]
{
    var result: [U] = []
    
    for x in xs
    {
        result.append(f(x))
    }
    
    return result
}

func boolArray(xs: [Int]) -> [Bool]
{
    return genericComputeArray(xs){ x in x % 2 == 0 }
}

boolArray(input)


func map1<T, U>(xs: [T], f: T -> U) -> [U]
{
    var result: [U] = []
    
    for x in xs
    {
        result.append(f(x))
    }
    
    return result
}

func computeInArray2<T>(xs: [Int], f: Int -> T) -> [T]
{
    return map1(xs, f: f)
}

func boolArray2(xs: [Int]) -> [Bool]
{
    return computeInArray2(xs){ x in x % 2 == 0 }
}

boolArray2(input)


var input2 = input.map{ x in x / 2 }
input2


let exampleFiles = ["README.md", "HelloWorld.swift", "HelloSwift.swift", "FlappyBird.swift"]

func filter<T>(xs: [T], check: T -> Bool) -> [T]
{
    var result: [T] = []
    for x in xs
    {
        if check(x)
        {
            result.append(x)
        }
    }
    
    return result
}

var result = filter(exampleFiles){ file in file.hasSuffix("swift") }
result

exampleFiles.filter { file in file.hasSuffix(".swift") }



func reduce1<A, R>(arr: [A], _ initialValue: R, combine: (R, A) -> R) -> R
{
    var result = initialValue
    for i in arr
    {
        result = combine(result, i)
    }
    return result
}

let input3 = [1, 2, 3, 4]

var sum = reduce1(input3, 0){ x, y in x + y }

sum

sum = reduce1(input3, 0, combine: *)
sum = reduce1(input3, 0, combine: -)


func flattenUsingReduce<T>(xss: [[T]]) -> [T]
{
    return reduce1(xss, []){ result, x in result + x }
}

func mapUsingReduce<T, U>(xs: [T], f: T -> U) -> [U]
{
    return reduce1(xs, []){ result, x in result + [f(x)] }
}


var result1 = mapUsingReduce(input3){ x in x * 3 }
result1

func filterUsingReduce<T>(xs: [T], check: T -> Bool) -> [T]
{
    return reduce1(xs, []){ result , x in return check(x) ? result + [x] : result }
}

result = filterUsingReduce(exampleFiles){ file in file.hasSuffix("swift") }
result


let numbers = [16, 25, 44]
let strings = numbers.map{ i -> String in
    var result: String = ""
    
    return result
}

strings

print(strings, appendNewline: false)