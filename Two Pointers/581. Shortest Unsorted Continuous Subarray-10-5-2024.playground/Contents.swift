/**
 581. **Shortest Unsorted Continuous Subarray**

 **Difficulty:** Medium

 Given an integer array `nums`, you need to find one **continuous subarray** such that if you
 sort this subarray in **non-decreasing order**, then the whole array will be sorted in non-decreasing order.

 Return the **length** of the shortest such subarray.

 - Parameters:
    - nums: **An array of integers** that represents the unsorted array.
 - Returns: The **length of the shortest continuous subarray** that, when sorted, makes the entire array sorted.

 ### Example 1:
 Input: nums = [2, 6, 4, 8, 10, 9, 15]
 Output: 5
 Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.

 ### Example 2:
 Input: nums = [1, 2, 3, 4]
 Output: 0

 ### Example 3:
 Input: nums = [1]
 Output: 0

 ### Constraints:
 - 1 <= nums.length <= 10^4
 - -10^5 <= nums[i] <= 10^5

 ### Follow-up:
 Can you solve it in **O(n)** time complexity?
 */

func findUnsortedSubarray(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return 0 }

    // Step 1: Find first out-of-order element form left.
    var left = 0
    while left < nums.count - 1, nums[left] <= nums[left + 1] {
        left += 1
    }

    // If we traversed the whole array, it is already sorted.
    if left == nums.count - 1 {
        return 0
    }

    // Step 2: Find first out-of-order element from right.
    var right = nums.count - 1
    while right > 0, nums[right] >= nums[right - 1] {
        right -= 1
    }

    // Step 3: Find minimum and maximum in subarray.
    var smallest = Int.max
    var largest = Int.min
    for i in left...right {
        smallest = min(smallest, nums[i])
        largest = max(largest, nums[i])
    }

    // Step 4: Check if we must expand our window (in example if first out-of-order element form left is smaller than number to the left.
    while left > 0, nums[left - 1] > smallest {
        left -= 1
    }

    while right < nums.count - 1, nums[right + 1] < largest {
        right += 1
    }

    // Step 5: Return lenght
    return right - left + 1
}

findUnsortedSubarray([2,6,4,8,10,9,15])
