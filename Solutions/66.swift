class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var output = digits
        var carry = 0
        for i in output.indices.reversed() {
            let incremented = output[i] + 1
            output[i] = incremented % 10
            carry = incremented / 10
            if carry == 0 {
                return output
            }
        }
        return [carry] + output
    }
}
