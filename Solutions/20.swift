class Solution {
    func isValid(_ s: String) -> Bool {
        var pendingOpenChars = ""
        for char in s {
            if openToClose.keys.contains(char) {
                pendingOpenChars.append(char)
            } else {
                guard let lastOpenChar = pendingOpenChars.popLast() else { return false }
                guard openToClose[lastOpenChar] == char else { return false }
            }
        }
        return pendingOpenChars.isEmpty
    }

    private let openToClose: [Character: Character] = [
        "(": ")",
        "{": "}",
        "[": "]",
    ]
}
