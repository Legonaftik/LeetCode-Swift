class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var low = 0
        var high = Int(Double(c).squareRoot())
        while low <= high {
            let guess = low * low + high * high
            if guess < c {
                low += 1
            } else if guess > c {
                high -= 1
            } else {
                return true
            }
        }
        return false
    }
}
