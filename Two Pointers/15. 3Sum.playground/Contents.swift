/*
 # 15. 3Sum (Medium)

 ## Problem Description:
 Given an integer array `nums`, return **all** the triplets `[nums[i], nums[j], nums[k]]` such that:
 - `i != j`, `i != k`, and `j != k`
 - `nums[i] + nums[j] + nums[k] == 0`

 **Note:** The solution set must not contain **duplicate triplets**.

 ## Example 1:
 - Input: `nums = [-1, 0, 1, 2, -1, -4]`
 - Output: `[[-1,-1,2],[-1,0,1]]`
 - Explanation:
   - `nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0`
   - `nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0`
   - `nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0`
   - The distinct triplets are `[-1, 0, 1]` and `[-1, -1, 2]`.

 **Note:** The order of the output and the order of the triplets does not matter.

 ## Example 2:
 - Input: `nums = [0,1,1]`
 - Output: `[]`
 - Explanation: No triplet sums up to 0.

 ## Example 3:
 - Input: `nums = [0,0,0]`
 - Output: `[[0,0,0]]`
 - Explanation: The only possible triplet sums up to 0.

 ## Constraints:
 - `3 <= nums.length <= 3000`
 - `-10^5 <= nums[i] <= 10^5`

 ## Topics:
 Array Manipulation
 Sorting
 Two-pointer technique
*/

func threeSum(_ nums: [Int]) -> [[Int]] {
    // Result array
    var result: [[Int]] = []
    // Need to sort input array first
    var nums = nums.sorted()

    for (index, number) in nums.enumerated() {
        if index > 0 && number == nums[index - 1] {
            continue // We must check if element is not the first element in array. So we can perform `nums[index-1]` operation.
        }

        // Left and Right pointers
        var leftP = index + 1
        var rightP = nums.count - 1

        // We can not have duplicates, so pointers must not meet.
        while leftP < rightP {
            let sum = number + nums[leftP] + nums[rightP]

            if sum == 0 {
                result.append([number, nums[leftP], nums[rightP]])

                // By performing `leftP < rightP` we are ensuring by shifting pointers left and right pointers will not meet.
                while leftP < rightP && nums[leftP] == nums[leftP + 1] {
                    leftP += 1
                }

                while leftP < rightP && nums[rightP] == nums[rightP - 1] {
                    rightP -= 1
                }

                leftP += 1
                rightP -= 1
            } else if sum > 0 {
                rightP -= 1
            } else {
                leftP += 1
            }
        }
    }

    return result
}

print(threeSum([-2,0,0,2,2]))
