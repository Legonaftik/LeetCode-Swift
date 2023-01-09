class Solution {
    func candy(_ ratings: [Int]) -> Int {
        var onlyLeft = Array(repeating: 1, count: ratings.count)
        for i in 1..<ratings.endIndex where ratings[i] > ratings[i-1] {
            onlyLeft[i] = onlyLeft[i-1] + 1
        }
        var onlyRight = Array(repeating: 1, count: ratings.count)
        for i in (1..<ratings.endIndex).reversed() where ratings[i-1] > ratings[i] {
            onlyRight[i-1] = onlyRight[i] + 1
        }
        return zip(onlyLeft, onlyRight)
            .map { max($0, $1) }
            .reduce(0, +)
    }
}
