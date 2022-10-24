class Solution {
    private let digitToString: [Character: String] = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    ]

    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { 
            return [] 
        }

        let strings = digits.map { digitToString[$0]! }
        var combinations: [String] = []
        var currentCombination = ""

        func letterCombinations(startIndex: Int) {
            if startIndex >= strings.endIndex {
                combinations.append(currentCombination)
            } else {
                for char in strings[startIndex] {
                    currentCombination.append(char)
                    letterCombinations(startIndex: startIndex+1)
                    currentCombination.removeLast()
                }
            }
        }

        letterCombinations(startIndex: 0)
        return combinations
    }
}
