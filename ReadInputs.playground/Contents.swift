
import Foundation

/**
 Swift read inputs from terminal
 */
var input = ""
while let thing = readLine() {
    input += thing + "\n"
}
print(input)

/**
 Separate string
 */
let str1 = "abc-def-ghi-jkl"
let separated = str1.components(separatedBy: "-")
print(separated)

/**
 Combine string
 */
let combined = separated.joined(separator: ".")
print(combined)
