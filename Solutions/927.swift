class Solution {

    private let impossible = [-1, -1]

    func threeEqualParts(_ arr: [Int]) -> [Int] {
        let totalOnes = arr.reduce(0, +)
        guard totalOnes % 3 == 0 else {
            return impossible
        }

        let targetOnes = totalOnes / 3
        guard targetOnes > 0 else {
            return [0, arr.endIndex-1]
        }

        var start1 = -1
        var end1 = -1
        var start2 = -1
        var end2 = -1
        var start3 = -1
        var end3 = -1

        var onesCounter = 0
        for (index, num) in arr.enumerated() where num == 1 {
            onesCounter += 1
            if onesCounter == 1 {
                start1 = index
            }
            if onesCounter == targetOnes {
                end1 = index   
            }
            if onesCounter == (targetOnes + 1) {
                start2 = index
            }
            if onesCounter == (2 * targetOnes) {
                end2 = index
            }
            if onesCounter == (2 * targetOnes + 1) {
                start3 = index
            }
            if onesCounter == (3 * targetOnes) {
                end3 = index
            }
        }

        guard arr[start1...end1] == arr[start2...end2] && arr[start1...end1] == arr[start3...end3] else {
            return impossible
        }

        let trailingZeros1 = start2 - end1 - 1
        let trailingZeros2 = start3 - end2 - 1
        let trailingZeros3 = arr.endIndex - end3 - 1
        guard trailingZeros3 <= min(trailingZeros1, trailingZeros2) else {
            return impossible
        }

        return [
            end1 + trailingZeros3, 
            end2 + trailingZeros3 + 1
        ]
    }
}