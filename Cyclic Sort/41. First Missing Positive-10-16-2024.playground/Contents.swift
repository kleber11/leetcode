/**
 # 41. First Missing Positive
 [LeetCode Problem 41](https://leetcode.com/problems/first-missing-positive/)

 Given an unsorted integer array `nums`, return the **smallest positive integer** that is not present in `nums`.

 You must implement an algorithm that runs in **O(n)** time and uses **O(1)** auxiliary space.

 ## Example 1:

 - **Input**: `nums = [1,2,0]`
 - **Output**: `3`
 - **Explanation**: The numbers in the range [1, 2] are all in the array, so the smallest missing positive integer is `3`.

 ## Example 2:

 - **Input**: `nums = [3,4,-1,1]`
 - **Output**: `2`
 - **Explanation**: `1` is in the array but `2` is missing.

 ## Example 3:

 - **Input**: `nums = [7,8,9,11,12]`
 - **Output**: `1`
 - **Explanation**: The smallest positive integer `1` is missing.

 ## Constraints:

 - `1 <= nums.length <= 10^5`
 - `-2^31 <= nums[i] <= 2^31 - 1`

 ## Topics:
 - Arrays
 - Hashing
 - In-place algorithms
 - Cyclic sort pattern
 */

func firstMissingPositive(_ nums: [Int]) -> Int {
    var i = 0
    var result = Int.max
    var nums = nums

    while i < nums.count {
        let correctPlace = nums[i] - 1
        if correctPlace < 0 {
            i += 1
            continue
        }
        if nums[i] < nums.count, nums[i] != nums[correctPlace] {
            nums.swapAt(i, correctPlace)
        } else {
            i += 1
        }
    }

    for (index, number) in nums.enumerated() {
        if index + 1 != number {
            return index + 1
        }
    }
    return nums.count + 1
}
firstMissingPositive([1,2,0])
firstMissingPositive([3,4,-1,1])
firstMissingPositive([7,8,9,11,12])
firstMissingPositive([-3, -2, -1])
firstMissingPositive([1, 2, 3, 4])
firstMissingPositive([1, 3, 6, 4, 1, 2])
firstMissingPositive([])
firstMissingPositive([2])
firstMissingPositive([-10, -3, 1, 3, 4, 2, 7])
