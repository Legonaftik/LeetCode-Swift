class Solution {
    func minCut(_ s: String) -> Int {
        let chars = Array(s)
        var minCuts = Array(chars.indices)

        func updateMinCuts(start: Int, end: Int) {
            var start = start, end = end
            while start >= 0, end < chars.endIndex, chars[start] == chars[end] {
                minCuts[end] = min(
                    minCuts[end],
                    start == 0 ? 0 : minCuts[start - 1] + 1
                )
                start -= 1
                end += 1
            }
        }

        for mid in chars.indices {
            updateMinCuts(start: mid, end: mid)
            updateMinCuts(start: mid-1, end: mid)
        }
        return minCuts.last!
    }
}
