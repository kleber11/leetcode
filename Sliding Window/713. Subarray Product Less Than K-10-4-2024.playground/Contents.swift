/**
 Subarray Product Less Than K Problem

 Given an array of integers `nums` and an integer `k`, return the number of contiguous subarrays where the product of all the elements in the subarray is strictly less than `k`.

 - Parameters:
    - nums: An array of integers.
    - k: An integer representing the threshold for the product of the subarrays.

 - Returns: The number of contiguous subarrays whose product of elements is strictly less than `k`.

 - Example 1:
    ```swift
    let nums = [10, 5, 2, 6]
    let k = 100
    // Output: 8
    // Explanation: The 8 subarrays that have product less than 100 are:
    // [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6]
    // Note: [10, 5, 2] is not included as its product is not strictly less than k.
    ```

 - Example 2:
    ```swift
    let nums = [1, 2, 3]
    let k = 0
    // Output: 0
    ```

 - Constraints:
    - `1 <= nums.length <= 30,000`
    - `1 <= nums[i] <= 1000`
    - `0 <= k <= 1,000,000`

 - Note:
    - If `k` is less than or equal to 1, there will be no subarrays with a product less than `k`.
*/

