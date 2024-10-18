/**
 # 9. Palindrome Number
 [LeetCode Problem 9](https://leetcode.com/problems/palindrome-number/)

 Given an integer `x`, return `true` if `x` is a palindrome, and `false` otherwise. An integer is a palindrome when it reads the same backward as forward.

 ## Example 1:

 - **Input**: `x = 121`
 - **Output**: `true`

 ## Example 2:

 - **Input**: `x = -121`
 - **Output**: `false`
 - **Explanation**: From left to right, it reads `-121`. From right to left, it becomes `121-`, which is not the same.

 ## Example 3:

 - **Input**: `x = 10`
 - **Output**: `false`
 - **Explanation**: Reads `01` from right to left, which is not the same as `10`.

 ## Constraints:

 - `-2^31 <= x <= 2^31 - 1`

 ## Topics:
 - Math
 - String
 */

func isPalindrome(_ x: Int) -> Bool {
    guard x >= 0 else { return false }

    var y = x
    var result = 0
    while y != 0 {
        let pop = y % 10
        y = y / 10
        result = result * 10 + pop
    }

    return result == x
}

isPalindrome(-121)
