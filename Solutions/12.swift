class Solution {

    private let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    private let symbols = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]

    func intToRoman(_ num: Int) -> String {
        var num = num
        var answer = ""
        for (value, symbol) in zip(values, symbols) {
            while value <= num {
                num -= value
                answer += symbol
            }
        }
        return answer 
    }
}
