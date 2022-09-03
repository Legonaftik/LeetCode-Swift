class Solution {
    func myAtoi(_ s: String) -> Int {
        let firstNonSpaceIndex = s.firstIndex(where: { $0 != " " }) ?? s.endIndex
        if firstNonSpaceIndex == s.endIndex { return 0 }

        let signMultiplier: Int = {
            if s[firstNonSpaceIndex] == "-" {
                return -1
            } else {
                return 1
            }
        }()

        let firstDigitIndex: String.Index = {
            let char = s[firstNonSpaceIndex]
            if char == "+" || char == "-" {
                return s.index(after: firstNonSpaceIndex)   
            } else if char.isNumber {
                return firstNonSpaceIndex
            } else {
                return s.endIndex
            }
        }()
        if firstDigitIndex == s.endIndex { return 0 }

        var result = 0
        let lowerLimit = -Int(pow(2.0, 31.0))
        let upperLimit = Int(pow(2.0, 31.0)) - 1

        for char in s[firstDigitIndex...] {
            guard let digit = char.wholeNumberValue else { return result }
            result *= 10
            result += (digit * signMultiplier)
            if result >= upperLimit {
                return upperLimit
            } else if result <= lowerLimit {
                return lowerLimit
            }
        }

        return result
    }
}