/**
 4Sum Problem

 This function returns all unique quadruplets `[nums[a], nums[b], nums[c], nums[d]]` from the given array `nums` that sum to the specified target.

 - Parameters:
    - nums: An array of `n` integers.
    - target: The target integer that the sum of the quadruplet should equal.

 - Returns: An array of arrays, where each sub-array represents a unique quadruplet that satisfies the condition `nums[a] + nums[b] + nums[c] + nums[d] == target`.

 - Important:
    - The quadruplets must meet the following conditions:
        1. `0 <= a, b, c, d < n`
        2. `a`, `b`, `c`, and `d` must be **distinct** indices.
        3. The sum `nums[a] + nums[b] + nums[c] + nums[d]` must equal the `target`.
    - The result may be returned in **any order**.

 - Example 1:
    ```swift
    let nums = [1, 0, -1, 0, -2, 2]
    let target = 0
    // Output: [[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]]
    ```

 - Example 2:
    ```swift
    let nums = [2, 2, 2, 2, 2]
    let target = 8
    // Output: [[2, 2, 2, 2]]
    ```

 - Constraints:
    - `nums.count` is between 1 and 200, inclusive.
    - Each element in `nums` is between -10^9 and 10^9, inclusive.
    - `target` is between -10^9 and 10^9, inclusive.

 - Note:
    - The solution should aim to find all unique quadruplets, avoiding duplicates.
*/

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    // Result array.
    var result: [[Int]] = []
    // Sort input array. Two Pointers technique requires to get it sorted before iterating thought array.
    var nums = nums.sorted()

    for i in 0..<nums.count - 3 {
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }

        for j in i+1..<nums.count - 2 {
            if j > i+1 && nums[j] == nums[j - 1] {
                continue
            }

            var leftPointer = j + 1
            var rightPointer = nums.count - 1

            while leftPointer < rightPointer {
                let sum = nums[rightPointer] + nums[leftPointer] + nums[j] + nums[i]

                if sum == target {
                    result.append([nums[leftPointer], nums[rightPointer], nums[i], nums[j]])
                    rightPointer -= 1
                    leftPointer += 1

                    while leftPointer < rightPointer && nums[leftPointer] == nums[leftPointer - 1] {
                        leftPointer += 1
                    }
                    while leftPointer < rightPointer && nums[rightPointer] == nums[rightPointer + 1] {
                        rightPointer -= 1
                    }
                } else if sum > target {
                    rightPointer -= 1
                } else {
                    leftPointer += 1
                }
            }
        }
    }
    return result
}

print(fourSum([1,0,-1,0,-2,2], 0))
