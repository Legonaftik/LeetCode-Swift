class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count >= 2 else {
            return strs.first ?? ""
        }

        let shortestStringLength = strs
            .map { $0.count }
            .min()!
        guard shortestStringLength > 0 else {
            return ""
        }

        let strs = strs.map { Array($0) }
        var answer = ""

        for index in 0..<shortestStringLength {
            let commonChar = strs[0][index]
            for chars in strs[1...] {
                if chars[index] != commonChar {
                    return answer
                }
            }
            answer += String(commonChar)
        }

        return answer
    }
}
