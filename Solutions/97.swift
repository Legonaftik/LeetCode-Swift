class Solution {
    private struct Key: Hashable {
        let index1: String.Index
        let index2: String.Index
    }

    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else { return false }
        var memo: [Key: Bool] = [:]

        func isInterleaveDP(
            index1: String.Index,
            index2: String.Index,
            index3: String.Index
        ) -> Bool {
            let key = Key(index1: index1, index2: index2)
            if let cachedValue = memo[key] {
                return cachedValue
            }
            let output: Bool = {
                if index1 >= s1.endIndex {
                    return s2[index2...] == s3[index3...]
                } else if index2 >= s2.endIndex {
                    return s1[index1...] == s3[index3...]
                } else if s1[index1] == s3[index3] && isInterleaveDP(index1: s1.index(after: index1), index2: index2, index3: s3.index(after: index3)) {
                    return true
                } else if s2[index2] == s3[index3] && isInterleaveDP(index1: index1, index2: s2.index(after: index2), index3: s3.index(after: index3)) {
                    return true
                } else { 
                    return false 
                }
            }()
            memo[key] = output
            return output
        }
        return isInterleaveDP(
            index1: s1.startIndex,
            index2: s2.startIndex,
            index3: s3.startIndex
        )
    }
}
