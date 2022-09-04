class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var lower = 1
        var upper = n
        while lower < upper {
            let mid = lower + (upper - lower) / 2
            if isBadVersion(mid) {
                upper = mid
            } else {
                lower = mid + 1
            }
        }
        return lower
    }
}
