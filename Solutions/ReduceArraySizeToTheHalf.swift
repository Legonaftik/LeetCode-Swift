class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        var counters: [Int: Int] = [:]
        for num in arr {
            counters[num, default: 0] += 1
        }

        var answer = 0
        var remainingNums = arr.count
        for counter in counters.values.sorted().reversed() {
            if remainingNums <= (arr.count / 2) { break }
            remainingNums -= counter
            answer += 1
        }
        return answer
    }
}