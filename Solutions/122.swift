class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var previous = Int.max
        var output = 0
        for current in prices {
            if current > previous {
                output += current - previous
            }
            previous = current
        }
        return output
    }
}
