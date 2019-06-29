// Swift GCD

// Assign to var or constant
let f = { (x: Int) -> Int
    in
    return x + 42
}

f(9)
f(76)

// Closures in an array (or a dictionary, or a set, etc...)
let closures = [
    f,
    {(x: Int) -> Int in return x * 2},
    {x in return x - 8},
    {x in x*x},
    {$0 * 42}
]
// $0 means position zero

for fn in closures {
    fn(42)
}

// Functions and closures are exactly the same thing
func foo(x: Int) -> Int {
    return 42 + x
}

let foo = {(x: Int) -> Int
    in
    42 + x
}

foo(30)

// MARK: - Typealias
// Standard form: typealias newName = oldName
typealias Integer = Int

// Useful when used with functions and closures
// (Int) -> Int
typealias IntToInt = (Int) -> Int
typealias IntMaker = () -> Int

func makeCounter() -> IntMaker {
    var n = 0
    
    func adder() -> Int {
        n = n + 1
        return n
    }
    
    return adder
}

let counter1 = makeCounter()
counter1()

