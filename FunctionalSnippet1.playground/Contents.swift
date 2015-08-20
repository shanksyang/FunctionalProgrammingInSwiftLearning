extension Array {
    var decompose : (head: T, tail: [T])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }
}

func sum(xs: [Int]) -> Int {
    if let (head, tail) = xs.decompose {
        return head + sum(tail)
    } else {
        return 0
    }
}

var xs: [Int] = [1]
let result = sum(xs)
result


xs.decompose


xs[1..<1] = [12]

//xs[3..<3] = [13, 12, 32]

xs


extension Dictionary {
    var decompose : (head: (Key, Value), tail: [Key : Value])? {
        
        var headValue: (Key, Value)? = nil
        var tailDictionary: [Key : Value] = [Key : Value]()
        if count > 0 {
            var tempIndex = 0
            for (key, value) in self {
                if tempIndex == 0 {
                    tempIndex = 1
                    headValue = (key, value)
                    continue
                }
                tailDictionary[key] = value
            }
            
            return (headValue!, tailDictionary)
            
        }
        return nil
    }
}

func sumDic(dic: [String : Int]) -> Int {
    if let (head, tail) = dic.decompose {
        return head.1 + sumDic(tail)
    } else {
        return 0
    }
}

var dic: [String : Int] = [String : Int]()
dic["1"] = 2
dic["2"] = 32
dic["3"] = 2
dic["4"] = 32

sumDic(dic)

