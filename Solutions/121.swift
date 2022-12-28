class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var lowest = Int.max
        var output = 0
        for price in prices {
            lowest = min(lowest, price)
            output = max(output, price-lowest)
        }
        return output
    }
}
