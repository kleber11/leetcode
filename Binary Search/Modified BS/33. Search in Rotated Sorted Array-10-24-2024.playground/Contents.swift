/**
 ## 33: Search in Rotated Sorted Array
 [LeetCode Problem 33 URL](https://leetcode.com/problems/search-in-rotated-sorted-array)

 ## Description:
 You are given an integer array `nums` sorted in ascending order (with **distinct** values), and an integer `target`. Suppose that `nums` is rotated at some pivot unknown to you beforehand (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 You want to search for `target` in `nums`. If `target` exists, return its index. Otherwise, return `-1`.

 You must write an algorithm with `O(log n)` runtime complexity.

 ## Constraints:
 - `1 <= nums.length <= 5000`
 - `-10^4 <= nums[i] <= 10^4`
 - All values of `nums` are **unique**.
 - `nums` is guaranteed to be rotated at some pivot.
 - `-10^4 <= target <= 10^4`

 ## Example 1:
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4

 ## Example 2:
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1

 ## Example 3:
 Input: nums = [1], target = 0
 Output: -1
 */

// [20, 21, 22, 23, 24, 25, 0, 1 || 2, 3, 4, 5, 6, 7, 18, 19]
// -> 6 -> 12
// [20, 21, 22, 23, 24, 25, 0, 1]
// [2, 3, 4, 5, 6, 7, 18, 19]

func search(_ nums: [Int], _ target: Int) -> Int {
    guard !nums.isEmpty else { return -1 }

    var startP = 0
    var endP = nums.count - 1

    while startP <= endP {
        let mid = startP + (endP - startP) / 2
        if nums[mid] == target {
            return mid
        }

    }

    return -1
}

search([1,3,5], 1)
search([20, 21, 22, 23, 24, 25, 0, 1, 2, 3, 4, 5, 6, 7, 18, 19], 6)
search([4,5,6,7,0,1,2], 0)
search([4,5,6,7,0,1,2], 3)
search([1], 2)
search([1,3], 2)
search([1,3], 3)
search([4,5,6,7,0,1,2], 2)
