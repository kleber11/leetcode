/**
 # 7. Reverse Integer
 [LeetCode Problem 7](https://leetcode.com/problems/reverse-integer/)

 Given a signed 32-bit integer `x`, return `x` with its digits reversed. If reversing `x` causes the value to go outside the signed 32-bit integer range [-2^31, 2^31 - 1], then return `0`.

 ## Example 1:

 - **Input**: `x = 123`
 - **Output**: `321`

 ## Example 2:

 - **Input**: `x = -123`
 - **Output**: `-321`

 ## Example 3:

 - **Input**: `x = 120`
 - **Output**: `21`

 ## Example 4:

 - **Input**: `x = 0`
 - **Output**: `0`

 ## Constraints:

 - `-2^31 <= x <= 2^31 - 1`

 ## Topics:
 - Math
 - String
 */

func reverse(_ x: Int) -> Int {
    var x = x
    var res = 0

    while x != 0 {
        let lastDigit = x % 10
        x /= 10
        res *= 10 + lastDigit

        // to prevent int overflow
        if res > Int32.max || res < Int32.min {
            return 0
        }
    }

    return res
}

