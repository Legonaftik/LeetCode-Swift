class Solution {
    func connect(_ root: Node?) -> Node? {
        var nextLeftmost: Node? = root
        while let leftmost = nextLeftmost {
            var nextParent: Node? = leftmost
            while let parent = nextParent {
                parent.left?.next = parent.right
                parent.right?.next = parent.next?.left
                nextParent = parent.next
            }
            nextLeftmost = leftmost.left
        }
        return root
    }
}
