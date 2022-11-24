class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else { return -1 }

        var lower = haystack.startIndex
        var upper = haystack.index(
            haystack.startIndex,
            offsetBy: needle.count - 1
        )
        while upper < haystack.endIndex {
            if haystack[lower...upper] == needle {
                return haystack.distance(from: haystack.startIndex, to: lower)
            }
            lower = haystack.index(after: lower)
            upper = haystack.index(after: upper)
        }
        return -1
    }
}
