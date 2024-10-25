/**
 ## 704. Binary Search
 [LeetCode Problem URL](https://leetcode.com/problems/binary-search)

 You are given a sorted array of integers `nums` and an integer `target`.
 Implement a function to search `target` in `nums` using the Binary Search algorithm.
 If the target exists, return its index. Otherwise, return `-1`.

 ## Constraints:
 - 1 <= nums.count <= 10^4
 - -10^4 <= nums[i], target <= 10^4
 - All elements in nums are unique.
 - nums is sorted in non-decreasing order.

 ## Examples:

 Example 1:
 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4.

 Example 2:
 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums, so the function returns -1.
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    guard !nums.isEmpty else { return -1 }

    var startP = 0
    var endP = nums.count - 1

    while startP <= endP {
        let mid = startP + (endP - startP) / 2
        if target == nums[mid] {
            return mid
        }

        if target > nums[mid] {
            startP = mid + 1
        } else {
            endP = mid - 1
        }
    }

    return -1
}

search([-1,0,3,5,9,12], 9)
