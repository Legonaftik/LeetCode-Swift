class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if intervals.isEmpty {
            return [newInterval]
        }

        var firstIntersectionIndex = intervals.endIndex
        var mergeIntervalStart = min(intervals.first![0], newInterval[0])
        for (index, interval) in intervals.enumerated() {
            if doesInterval(newInterval, endBeforeStartOf: interval) {
                return Array(intervals.prefix(index)) 
                    + [newInterval]
                    + Array(intervals[index...])
            } else if areOverlapping(interval, newInterval) {
                firstIntersectionIndex = index
                mergeIntervalStart = min(interval[0], newInterval[0])
                break
            }
        }
        if firstIntersectionIndex == intervals.endIndex {
            return intervals + [newInterval]
        }

        var lastIntersectionIndex = intervals.endIndex-1
        var mergeIntervalEnd = max(intervals.last![1], newInterval[1])
        for (index, interval) in intervals.enumerated() {
            if doesInterval(newInterval, endBeforeStartOf: interval) {
                lastIntersectionIndex = index-1
                mergeIntervalEnd = max(intervals[lastIntersectionIndex][1], newInterval[1])
                break
            }
        }

        return Array(intervals.prefix(firstIntersectionIndex)) 
            + [[mergeIntervalStart, mergeIntervalEnd]]
            + Array(intervals[(lastIntersectionIndex+1)...])
    }

    private func areOverlapping(_ interval1: [Int], _ interval2: [Int]) -> Bool {
        if doesInterval(interval1, endBeforeStartOf: interval2) { return false }
        if doesInterval(interval2, endBeforeStartOf: interval1) { return false }
        return true
    }

    private func doesInterval(_ interval1: [Int], endBeforeStartOf interval2: [Int]) -> Bool {
        return interval1[1] < interval2[0]
    }
}
