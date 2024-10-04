/**
 # 287. Find the Duplicate Number

 **Difficulty**: Medium

 ## Problem Statement
 Given an array of integers `nums` containing **n + 1** integers, where each integer is in the range **[1, n]** inclusive. There is only **one repeated number** in `nums`. Return this repeated number. You must solve the problem without modifying the array `nums` and using only constant extra space.

 ## Examples
 - Example 1: Input: nums = [1, 3, 4, 2, 2] Output: 2
 - Example 2: Input: nums = [3, 1, 3, 4, 2] Output: 3
 - Example 3: Input: nums = [3, 3, 3, 3, 3] Output: 3

 ## Constraints
 - `1 <= n <= 10^5`
 - `nums.length == n + 1`
 - `1 <= nums[i] <= n`
 - All integers in `nums` appear only once except for precisely one integer which appears two or more times.

 ## Follow-up Questions
 1. How can we prove that at least one duplicate number must exist in `nums`?
 2. Can you solve the problem in linear runtime complexity?
 */

func findDuplicate(_ nums: [Int]) -> Int {
    // Define pointers.
    var slowP = nums[0]
    var fastP = nums[0]

    // Move pointers
    repeat {
        slowP = nums[slowP]
        fastP = nums[nums[fastP]]
    } while slowP != fastP

    // Detect entrance to the cycle
    slowP = nums[0]
    while slowP != fastP {
        slowP = nums[slowP]
        fastP = nums[fastP]
    }
    return fastP
}
findDuplicate([3, 1, 4, 2, 2])
