class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        let nodes = preorder.split(separator: ",")
        var index = -1

        func traverse() {
            index += 1
            guard index < nodes.endIndex else { return }
            if nodes[index] != "#" {
                traverse()
                traverse()
            }
        }

        traverse()
        return index == nodes.endIndex-1
    }
}
