class Solution {
    func numTrees(_ n: Int) -> Int {
        var memo: [Int: Int] = [:]
        memo[0] = 1
        memo[1] = 1
        
        func numTrees(nodes: Int) -> Int {
            if let cachedValue = memo[nodes] {
                return cachedValue
            }
            var answer = 0
            for root in 1...nodes {
                answer += numTrees(nodes: root-1) * numTrees(nodes: nodes-root)
            }
            memo[nodes] = answer
            return answer
        }
        
        return numTrees(nodes: n)
    }
}
