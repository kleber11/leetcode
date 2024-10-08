/**
 ## 202. Happy Number

 **Topics:** Number Theory, Math, Cycle Detection

 Write an algorithm to determine if a number `n` is a **happy number**.

 A **happy number** is defined by the following process:
 - Starting with any positive integer, replace the number by the **sum of the squares of its digits**.
 - Repeat the process until the number equals **1** (where it will stay), or it **loops endlessly in a cycle** which does not include `1`.
 - Those numbers for which this process ends in `1` are called **happy numbers**.

 Return `true` if `n` is a happy number, and `false` if not.

 ## Example 1:
 **Input:** `n = 19`
 **Output:** `true`
 **Explanation:**
 1² + 9² = 82
 8² + 2² = 68
 6² + 8² = 100
 1² + 0² + 0² = 1

 ## Example 2:
 **Input:** `n = 2`
 **Output:** `false`
 **Explanation:** The process enters a loop and does not reach `1`.

 ## Constraints:
 - **1 <= n <= 2³¹ - 1**
 */

func isHappy(_ n: Int) -> Bool {
    var fastP = n
    var slowP = n
    repeat {
        fastP = getNext(getNext(fastP))
        slowP = getNext(slowP)
        if fastP == 1 {
            return true
        }
        if fastP == slowP {
            return false
        }
    } while true
}

// 1 9
func getNext(_ n: Int) -> Int {
    var sum = 0
    var n = n
    while n > 0 {
        var digit = n % 10 // This operation extracts last digit
        sum += digit * digit // This adds square of digits to the sum
        n /= 10 // This moves to the next digit (first)
    }
    return sum
}

isHappy(19)
isHappy(2)
