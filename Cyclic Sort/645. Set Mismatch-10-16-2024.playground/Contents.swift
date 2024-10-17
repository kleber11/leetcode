/**
 # 645. Set Mismatch
 [LeetCode Problem 645](https://leetcode.com/problems/set-mismatch/)

 You have a set of integers `s`, which originally contains all the numbers from `1` to `n`. Unfortunately, due to an error, one of the numbers in `s` got duplicated, resulting in the repetition of one number and the loss of another.

 You are given an integer array `nums` representing the data status of this set after the error.

 Find the number that occurs **twice** and the number that is **missing**, and return them in the form of an array.

 ## Example 1:

 - **Input**: `nums = [1,2,2,4]`
 - **Output**: `[2,3]`

 ## Example 2:

 - **Input**: `nums = [1,1]`
 - **Output**: `[1,2]`

 ## Constraints:

 - `2 <= nums.length <= 10^4`
 - `1 <= nums[i] <= 10^4`

 ## Topics:
 - Arrays
 - Hashing
 - In-place algorithms
 - Cyclic sort pattern
 */

func findErrorNums(_ nums: [Int]) -> [Int] {
    // Define variables
    var i = 0
    var nums = nums

    // Iterate throught array and swap element in-place
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
            return [number, index + 1]
        }
    }

    return []
}

print(findErrorNums([1,2,2,4]))
