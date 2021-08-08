class Solution {

    func partition(_ s: String) -> [[String]] {
        let characters = Array(s)
        var output: [[String]] = []
        var currentArray: [String] = []
        var dp = Array(
            repeating: Array(repeating: false, count: characters.count),
            count: characters.count
        )

        func isPalindrome(start: Int, end: Int) -> Bool {
            return characters[start] == characters[end] 
                && (end - start < 2 || dp[start+1][end-1])
        }

        func backtrack(start: Int) {            
            guard start < characters.endIndex else {
                output.append(currentArray)
                return
            }
            for end in start..<characters.endIndex {
                guard isPalindrome(start: start, end: end) else { continue }
                dp[start][end] = true
                currentArray.append(String(characters[start...end]))
                backtrack(start: end+1)
                currentArray.removeLast()
            }
        }

        backtrack(start: 0)
        return output
    }
}
