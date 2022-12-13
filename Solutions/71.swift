class Solution {
    func simplifyPath(_ path: String) -> String {
        var components: [Substring] = []
        for component in path.split(separator: "/") {
            switch component {
            case ".":
                continue
            case "..":
                components.popLast()
            default:
                components.append(component)
            }
        }
        return "/" + components.joined(separator: "/")
    }
}
