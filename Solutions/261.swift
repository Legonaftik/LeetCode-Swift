class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        guard edges.count == n-1 else { return false }

        var graph: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }

        var seen: Set<Int> = []

        func hasCycle(node: Int, parent: Int) -> Bool {
            if seen.contains(node) { return true }
            seen.insert(node)
            for neighbor in graph[node] {
                if neighbor == parent { continue }
                if hasCycle(node: neighbor, parent: node) {
                    return true
                }
            }
            return false
        }

        return !hasCycle(node: 0, parent: -1) && seen.count == n
    }
}
