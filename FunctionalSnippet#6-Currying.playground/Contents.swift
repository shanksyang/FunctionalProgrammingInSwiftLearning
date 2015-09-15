func login(email: String, pw: String, success: Bool -> ())
{
    success(true)
}

func curriedLogin1(email: String)(pw: String)(success: Bool -> ())
{
    success(true)
}

let f = curriedLogin1("foo")(pw:"bar")


f(){a in
    println("success: \(a)")
}


func curry<A, B, C, R>(f: (A, B, C) -> R) -> A -> B -> C -> R {
    return { a in { b in { c in f(a, b, c) } } }
}

let curriedLogin2 = curry(login)

let f1 = curriedLogin2("foo")("bar")
f1 { println("success: \($0)") }
