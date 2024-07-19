import UIKit
import Foundation

func multiply(num1: String, num2: String) -> String {
    if num1 == "0" || num2 == "0" {
        return "0"
    }
    let num1Count = num1.count
    let num2Count = num2.count
    var result = [Int](repeating: 0, count: num1Count + num2Count)
    let num1Array = Array(num1)
    let num2Array = Array(num2)
    
    for i in (0..<num1Count).reversed() { //loop from rightmost to leftmost
        for j in (0..<num2Count).reversed() {
            let digit1 = Int(String(num1Array[i]))!
            let digit2 = Int(String(num2Array[j]))!
            let product = digit1*digit2
            let sum = product+result[i+j+1]
            result[i+j+1] = sum%10 //placing result at correct position
            result[i+j] += sum/10 //carry over to the next higher position
        }
    }
    
    var resultString = result.map { String($0) }.joined() //converting result to string
    while resultString.first == "0" {
        resultString.removeFirst() //removing leading zero
    }
    return resultString
}

multiply(num1: "234", num2: "789")
