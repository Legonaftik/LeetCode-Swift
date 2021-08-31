class Solution {
    func maxCount(
        _ m: Int,
        _ n: Int,
        _ ops: [[Int]]
    ) -> Int {
        var minX = m
        var minY = n
        for op in ops {
            minX = min(minX, op[0])
            minY = min(minY, op[1])
        }
        return minX * minY
    }
}
