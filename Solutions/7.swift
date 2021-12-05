class Solution {
    func reverse(_ x: Int) -> Int {
        var answer: Int32 = 0
        var x = Int32(x)
        while x != 0 {
            let digit = x % 10
            x /= 10
            if (answer > Int32.max/10) || (answer == Int32.max/10 && digit > Int32.max%10) {
                return 0
            }
            if (answer < Int32.min/10) || (answer == Int32.min/10 && digit < Int32.min%10) {
                return 0
            }
            answer = answer * 10 + digit
        }
        return Int(answer)
    }
}
