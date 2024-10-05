/**
 ## 713. Subarray Product Less Than K

 Given an array of integers `nums` and an integer `k`, return the number of **contiguous subarrays**
 where the product of all the elements in the subarray is **strictly less than** `k`.

 # **Example 1:**

 Input: nums = [10, 5, 2, 6], k = 100
 Output: 8
 Explanation: The 8 subarrays that have product less than 100 are:
 [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6].

 Note that [10, 5, 2] is not included as the product of 100 is **not strictly less than k**.

 # **Example 2:**
 Input: nums = [1, 2, 3], k = 0
 Output: 0
 Explanation: Since `k` is 0, no subarray product can be less than 0.

 **Constraints:**
 - 1 <= nums.length <= 3 * 10^4
 - 1 <= nums[i] <= 1000
 - 0 <= k <= 10^6
 */

/// Note: - To solve this question you should also use `Sliding Window`, not only `Two Pointers`.
func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    if k == 0 {
        return 0
    }
    var leftPointer = 0
    var result = 0
    /// Initially set it to `1`, because first number multiplied by 1 always will be this number.
    var product = 1

    for rightPointer in 0..<nums.count {
        product *= nums[rightPointer]
        // Here we create and shift our Sliding Window
        while leftPointer <= rightPointer, product >= k {
            product /= nums[leftPointer]
            leftPointer += 1
        }
        // Adding size of the window to result
        result += rightPointer - leftPointer + 1
    }

    return result
}

numSubarrayProductLessThanK([57,44,92,28,66,60,37,33,52,38,29,76,8,75,22], 18)
