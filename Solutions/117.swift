class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var currentLevel: [Node] = [root]
        while !currentLevel.isEmpty {
            var nextLevel: [Node] = []
            for i in currentLevel.indices {
                if i > 0 {
                    currentLevel[i-1].next = currentLevel[i]
                }
                if let leftChild = currentLevel[i].left {
                    nextLevel.append(leftChild)
                }
                if let rightChild = currentLevel[i].right {
                    nextLevel.append(rightChild)
                }
            }
            currentLevel = nextLevel
        }
        return root
    }
}
