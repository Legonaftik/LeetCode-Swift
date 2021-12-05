class Solution {

    private let charToInt: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]

    func romanToInt(_ s: String) -> Int {        
        var answer = 0
        let chars = Array(s)

        for index in 0..<(chars.endIndex-1) {
            let currentChar = chars[index]
            let nextChar = chars[index+1]
            let currentValue = intValue(currentChar)
            let nextValue = intValue(nextChar)
            if currentValue < nextValue {
                answer -= currentValue
            } else {
                answer += currentValue
            }
        }
        answer += intValue(chars.last!)

        return answer
    }

    private func intValue(_ char: Character) -> Int {
        return charToInt[char] ?? 0
    }
}
