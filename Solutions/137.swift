class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var seenOnlyOnce = 0
        var seenOnlyTwice = 0
        for num in nums {
            seenOnlyOnce = ~seenOnlyTwice & (seenOnlyOnce ^ num)
            seenOnlyTwice = ~seenOnlyOnce & (seenOnlyTwice ^ num)
        }
        return seenOnlyOnce
    }
}
