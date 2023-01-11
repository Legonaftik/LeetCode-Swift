class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var visited: [Node: Node] = [:]

        func deepCopy(of node: Node?) -> Node? {
            guard let node = node else { return nil }
            if let existingCopy = visited[node] { return existingCopy }
            let nodeCopy = Node(node.val)
            visited[node] = nodeCopy
            nodeCopy.next = deepCopy(of: node.next)
            nodeCopy.random = deepCopy(of: node.random)
            return nodeCopy
        }

        return deepCopy(of: head)
    }
}
