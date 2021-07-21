class Solution {

    private let original: [Int]

    init(_ nums: [Int]) {
        self.original = nums
    }

    func reset() -> [Int] {
        return original
    }

    func shuffle() -> [Int] {
        var shuffled = original
        for insertionIndex in original.indices {
            let randomIndex = Int.random(in: 0...insertionIndex)
            shuffled.swapAt(insertionIndex, randomIndex)
        }
        return shuffled
    }
}
