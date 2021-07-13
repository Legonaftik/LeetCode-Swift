class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        return isConvertable(string: s, to: t) && isConvertable(string: t, to: s)
    }

    private func isConvertable(string string1: String, to string2: String) -> Bool {
        var mappings: [Character: Character] = [:]
        for (char1, char2) in zip(string1, string2) {
            if let existingMapping = mappings[char1], existingMapping != char2 {
                return false
            } else {
                mappings[char1] = char2
            }
        }
        return true
    }
}