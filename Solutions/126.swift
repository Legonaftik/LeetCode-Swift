class Solution {
    private let allLetters = "abcdefghijklmnopqrstuvwxyz"

    func findLadders(
        _ beginWord: String,
        _ endWord: String,
        _ wordList: [String]
    ) -> [[String]] {
        var wordToIndex: [String: Int] = [:] // For O(1) lookup and to avoid storing copies of strings elsewhere
        for (index, word) in wordList.enumerated() {
            wordToIndex[word] = index
        }
        if wordToIndex[endWord] == nil { return [] }
        let beginWordIndex = Int.min // beginWord cannot be in wordList - using a special value to cover the corner-case

        var outputPaths: [[Int]] = []
        var allSeen: Set<Int> = []
        var found = false
        var currentQueue: [[Int]] = [[beginWordIndex]] 
        while !found && !currentQueue.isEmpty {
            var nextQueue: [[Int]] = []
            var newSeen: Set<Int> = []
            for path in currentQueue {
                let previousWordIndex = path.last!
                if previousWordIndex == wordToIndex[endWord] {
                    found = true
                    outputPaths.append(path)
                } else {
                    let previousWord = previousWordIndex == beginWordIndex ? beginWord : wordList[previousWordIndex]
                    for i in previousWord.indices {
                        for char in allLetters where previousWord[i] != char {
                            let suffix = i == previousWord.index(before: previousWord.endIndex) ? "" : String(previousWord[previousWord.index(after: i)...])
                            let newWord = String(previousWord[..<i]) + String(char) + suffix
                            if let index = wordToIndex[newWord], !allSeen.contains(index) {
                                newSeen.insert(index)
                                nextQueue.append(path + [index])
                            }
                        }
                    }
                }
            }
            allSeen.formUnion(newSeen)
            currentQueue = nextQueue
        }
        return outputPaths.map { path in
            path.map { index in
                if index == beginWordIndex {
                    return beginWord
                } else {
                    return wordList[index]
                }
            }
        }
    }
}
