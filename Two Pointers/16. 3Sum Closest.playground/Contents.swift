/// # 3Sum Closest
///
/// **Difficulty**: Medium
///
/// ## Description:
/// Given an integer array `nums` of length `n` and an integer `target`,
/// find three integers in `nums` such that their sum is **closest** to `target`.
///
/// - Returns: The sum of the three integers closest to the target.
///
/// *You may assume that each input will have exactly one solution.*
///
/// ## Example 1:
/// - **Input**: `nums = [-1, 2, 1, -4]`, `target = 1`
/// - **Output**: `2`
/// - **Explanation**: The sum that is closest to the target is `2`.
///   (`-1 + 2 + 1 = 2`)
///
/// ## Example 2:
/// - **Input**: `nums = [0, 0, 0]`, `target = 1`
/// - **Output**: `0`
/// - **Explanation**: The sum that is closest to the target is `0`.
///   (`0 + 0 + 0 = 0`)
///
/// ## Constraints:
/// - `3 <= nums.length <= 500`
/// - `-1000 <= nums[i] <= 1000`
/// - `-10^4 <= target <= 10^4`

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count >= 3 else { return 0 }
    // Step 1: Sort array. Without sorting we cannot use `two pointers` technique.
    var nums = nums.sorted()
    // Step 2: Calculate first possible sum.
    var minSum = nums[0] + nums[1] + nums[2]

    // Step 4: Iterate through array.
    for i in 0..<nums.count - 2 {
        var leftPointer = i + 1
        var rightPointer = nums.count - 1

        // Iterate through rest of array with two other pointers
        while leftPointer < rightPointer {
            let currentSum = nums[i] + nums[leftPointer] + nums[rightPointer]
            if abs(currentSum - target) < abs(minSum - target) {
                minSum = currentSum
            }

            if currentSum == target {
                return minSum
            } else if currentSum > target {
                rightPointer -= 1
            } else {
                leftPointer += 1
            }
        }
    }

    return minSum
}

print(threeSumClosest([-1, 2, 1, -4], 1)) // 2
print(threeSumClosest([-2, 0, 1, 2], 2)) // 1
print(threeSumClosest([-3, -1, 1, 2], 1)) // 0
print(threeSumClosest([4,0,5,-5,3,3,0,-4,-5], -2))

// Sorting the array will take O(N * logN). Overall, it will take O(N * logN + N^2), which is asymptotically equivalent to O(N^2).
// Space complexity: O(n)
