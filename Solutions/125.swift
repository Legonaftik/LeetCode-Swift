class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var lower = s.startIndex
        var higher = s.index(before: s.endIndex)
        while lower < higher {            
            while lower < higher && !s[lower].isAlphanumeric {
                lower = s.index(after: lower) 
            }
            while lower < higher && !s[higher].isAlphanumeric {
                higher = s.index(before: higher)
            }
            if s[lower].lowercased() != s[higher].lowercased() { return false }
            if higher <= s.startIndex || lower >= s.endIndex { return true }
            lower = s.index(after: lower)
            higher = s.index(before: higher)   
        }
        return true
    }
}

extension Character {
    var isAlphanumeric: Bool {
        return isLetter || isNumber
    }
}
