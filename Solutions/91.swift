class Solution {
    func numDecodings(_ s: String) -> Int {
        let chars = Array(s)
        var memo: [Int?] = Array(repeating: nil, count: chars.count)

        func numDecodings(startIndex: Int) -> Int {
            if startIndex >= chars.endIndex {
                return 1
            }
            if let cachedValue = memo[startIndex] {
                return cachedValue
            }
            if chars[startIndex] == "0" {
                return 0
            }
            if startIndex == chars.endIndex-1 {
                return 1
            }
            
            var answer = numDecodings(startIndex: startIndex+1)
            let nextIndex = startIndex+1
            if Int(String(chars[startIndex...nextIndex]))! <= 26 {
                answer += numDecodings(startIndex: startIndex+2)
            }
            memo[startIndex] = answer
            return answer
        }

        return numDecodings(startIndex: 0)
    }
}