class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var answer: [String] = []
        var current = ""

        func generate(openLeft: Int, closeLeft: Int) {
            if openLeft == 0 && closeLeft == 0 {
                answer.append(current)
                return 
            }
            if openLeft > 0 {
                current.append("(")
                generate(openLeft: openLeft-1, closeLeft: closeLeft)
                current.removeLast()
            }
            if openLeft < closeLeft {
                current.append(")")
                generate(openLeft: openLeft, closeLeft: closeLeft-1)
                current.removeLast()
            }
        }

        generate(openLeft: n, closeLeft: n)
        return answer
    }
}
