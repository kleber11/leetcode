/**
 # 448. Find All Numbers Disappeared in an Array
 [LeetCode Problem 448](https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/)

 Given an array `nums` of `n` integers where `nums[i]` is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in `nums`.

 ## Example 1:

 - **Input**: `nums = [4,3,2,7,8,2,3,1]`
 - **Output**: `[5,6]`

 ## Example 2:

 - **Input**: `nums = [1,1]`
 - **Output**: `[2]`

 ## Constraints:

 - `n == nums.length`
 - `1 <= n <= 10^5`
 - `1 <= nums[i] <= n`

 ## Follow-up:

 - Could you solve it **without extra space** and in **O(n) runtime**?
 - You may assume the returned list does not count as extra space.

 ## Topics:
 - Arrays
 - Hashing
 - In-place modifications
 - Cyclic sort pattern
 */

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var i = 0
    var nums = nums
    var result: [Int] = []

    while i < nums.count {
        var correctPlace = nums[i] - 1
        if nums[i] != nums[correctPlace] {
            nums.swapAt(i, correctPlace)
        } else {
            i += 1
        }
    }

    for (index, number) in nums.enumerated() {
        if index + 1 != number {
            result.append(index + 1)
        }
    }

    return result
}

findDisappearedNumbers([1,1])
