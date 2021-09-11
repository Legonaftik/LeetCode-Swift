class Solution {
    func calculate(_ s: String) -> Int {
        var stack: [String] = []

        func evaluateExpression() -> Int {
            var answer = 0
            if let stackLast = stack.last, let num = Int(stackLast) {
                answer = num
                stack.removeLast()
            }
            while let stackLast = stack.last, stackLast != ")" {
                let sign = stack.removeLast()
                let num = Int(stack.removeLast())!
                if sign == "+" {
                    answer += num
                } else {
                    answer -= num
                }
            }
            return answer
        }

        var operand = 0
        var digits = 0
        for char in s.reversed() {
            if char.isNumber {
                operand = Int(pow(10.0, Double(digits))) * Int(String(char))! + operand
                digits += 1
            } else if char != " " {
                if digits > 0 {
                    stack.append(String(operand))
                    operand = 0
                    digits = 0
                }
                if char == "(" {
                    let expressionResult = evaluateExpression()
                    stack.removeLast()
                    stack.append(String(expressionResult))
                } else {
                    stack.append(String(char))
                }
            }
        }
        if digits > 0 {
            stack.append(String(operand))
        }
        return evaluateExpression()
    }
}
