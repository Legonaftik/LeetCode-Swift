class Solution {
    func countAndSay(_ n: Int) -> String {
        func countAndSay(input: String, n: Int) -> String {
            guard n > 1 else { return input }
            var output = ""
            var duplicateCount = 1
            var prevChar: Character?
            for char in input {
                if let prevChar = prevChar {
                    if char == prevChar {
                        duplicateCount += 1
                    } else {
                        output += "\(duplicateCount)\(prevChar)"
                        duplicateCount = 1
                    }   
                }
                prevChar = char
            }
            output += "\(duplicateCount)\(prevChar!)"
            return countAndSay(input: output, n: n - 1)
        }

        return countAndSay(input: "1", n: n)
    }
}
