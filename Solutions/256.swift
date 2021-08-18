class Solution {

    private struct Key: Hashable {
        let startIndex: Int
        let previousColor: Int
    }

    func minCost(_ costs: [[Int]]) -> Int {
        var memo: [Key: Int] = [:]

        func minCost(key: Key) -> Int {
            if key.startIndex >= costs.endIndex {
                return 0
            }
            if let cachedValue = memo[key] {
                return cachedValue
            }
            var bestCurrentColor = -1
            var bestCost = Int.max
            for color in costs[0].indices {
                guard color != key.previousColor else { continue }
                let cost = costs[key.startIndex][color] + minCost(key: Key(
                    startIndex: key.startIndex + 1,
                    previousColor: color
                ))
                if cost < bestCost {
                    bestCost = cost
                    bestCurrentColor = color
                }
            }
            memo[key] = bestCost
            return bestCost
        }

        return minCost(key: Key(startIndex: 0, previousColor: -1))
    }
}
