/**
 # 442. Find All Duplicates in an Array
 [LeetCode Problem 442](https://leetcode.com/problems/find-all-duplicates-in-an-array/)

 Given an integer array `nums` of length `n` where all the integers of `nums` are in the range [1, n] and each integer appears **at most twice**, return an array of all the integers that appear **twice**.

 You must write an algorithm that runs in **O(n)** time and uses only **constant auxiliary space**, excluding the space needed to store the output.

 ## Example 1:

 - **Input**: `nums = [4,3,2,7,8,2,3,1]`
 - **Output**: `[2,3]`

 ## Example 2:

 - **Input**: `nums = [1,1]`
 - **Output**: `[1]`

 ## Example 3:

 - **Input**: `nums = [1]`
 - **Output**: `[]`

 ## Constraints:

 - `n == nums.length`
 - `1 <= n <= 10^5`
 - `1 <= nums[i] <= n`
 - Each element in `nums` appears **once or twice**.

 ## Topics:
 - Arrays
 - Hashing
 - In-place algorithms
 - Cyclic sort pattern
 */

func findDuplicates(_ nums: [Int]) -> [Int] {
    // Define variables
    var i = 0
    var nums = nums
    var result: [Int] = []

    // Iterate throught array
    // [4,3,2,7,8,2,3,1] -> [7,3,2,4,8,2,3,1] -> [3,3,2,4,8,2,7,1] -> [2,3,3,4,8,2,7,1] -> [3,2,3,4,8,2,7,1] -> ...
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
            result.append(number)
        }
    }
    return result
}

findDuplicates([1,1])
