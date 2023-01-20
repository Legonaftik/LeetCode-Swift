private class Node {
    let key: Int
    var value: Int
    var next: Node?
    weak var previous: Node?

    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {
    private let preHead = Node(key: -1, value: -1)
    private let postTail = Node(key: -1, value: -1)
    private var size = 0
    private var cache: [Int: Node] = [:]

    private let capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity

        preHead.next = postTail
        postTail.previous = preHead
    }

    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            moveToHead(node: node)
            return node.value
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        if let existingNode = cache[key] {
            existingNode.value = value
            moveToHead(node: existingNode)
        } else {
            let newNode = Node(key: key, value: value)

            cache[key] = newNode
            add(node: newNode)
            
            size += 1

            if size > capacity {
                cache[popTail().key] = nil
                size -= 1
            }
        }
    }
    
    private func moveToHead(node: Node) {
        remove(node: node)
        add(node: node)
    }

    private func popTail() -> Node {
        let tailNode = postTail.previous!
        remove(node: tailNode)
        return tailNode
    }

    private func remove(node: Node) {
        let oldPrevious = node.previous
        let oldNext = node.next
        oldPrevious?.next = oldNext
        oldNext?.previous = oldPrevious
    }
    
    private func add(node: Node) {
        node.previous = preHead
        node.next = preHead.next
        preHead.next?.previous = node
        preHead.next = node
    }
}
