class Solution {
    func myAtoi(_ s: String) -> Int {
        var sign = 1
        var num = 0
        var index = 0
        let chars = Array(s)

        while index < chars.endIndex && chars[index] == " " {
            index += 1
        }

        if index < chars.endIndex && chars[index] == "+" {
            sign = 1
            index += 1
        } else if index < chars.endIndex && chars[index] == "-" {
            sign = -1
            index += 1
        }

        while index < chars.endIndex, let digit = Int(String(chars[index])) {
            if (num > Int32.max / 10) || (num == Int32.max / 10 && digit > Int32.max % 10) {
                return Int(sign == 1 ? Int32.max : Int32.min)
            }
            num = 10 * num + digit
            index += 1
        }

        return sign * num
    }
}
