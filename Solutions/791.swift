class Solution {
    func customSortString(_ order: String, _ str: String) -> String {
        var charToOrder: [Character: Int] = [:]
        for (index, char) in order.enumerated() {
            charToOrder[char] = index
        }
        return String(str.sorted {
            (charToOrder[$0] ?? .max) < (charToOrder[$1] ?? .max)
        })
    }
}
