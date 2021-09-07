class Solution {
    func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {
        var slowKey = Character("-")
        var slowTime = 0
        var lastTime = 0
        for (releaseTime, key) in zip(releaseTimes, keysPressed) {
            let time = releaseTime - lastTime
            lastTime = releaseTime
            if time > slowTime || (time == slowTime && key > slowKey) {
                slowTime = time
                slowKey = key
            }
        }
        return slowKey
    }
}
