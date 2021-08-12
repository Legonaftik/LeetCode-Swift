class Solution {
    func numWays(_ n: Int, _ k: Int) -> Int {
        var memo: [Int: Int] = [:]

        func numWays(lastIndex: Int) -> Int {
            switch lastIndex {
            case 0:
                return k
            case 1:
                return k * k
            default:
                if let cachedValue = memo[lastIndex] {
                    return cachedValue
                }
                let answer = (k - 1) * (numWays(lastIndex: lastIndex-1) + numWays(lastIndex: lastIndex-2))
                memo[lastIndex] = answer
                return answer
            }
        }

        return numWays(lastIndex: n - 1)
    }
}
