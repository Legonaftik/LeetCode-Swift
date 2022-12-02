class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var mergedIntervals: [[Int]] = [intervals[0]]
        for interval in intervals {
            let areOverlapping = mergedIntervals.last![1] >= interval[0]
            if areOverlapping {
                mergedIntervals[mergedIntervals.endIndex-1][1] = max(mergedIntervals[mergedIntervals.endIndex-1][1], interval[1])
            } else {
                mergedIntervals.append(interval)
            }
        }
        return mergedIntervals
    }
}
