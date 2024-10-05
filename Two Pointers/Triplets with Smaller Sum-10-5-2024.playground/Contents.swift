/**

 ## Problem Statement #

Given an array arr of unsorted numbers and a target sum, count all triplets in it such that arr[i] + arr[j] + arr[k] < target where i, j, and k are three different indices. Write a function to return the count of such triplets.

## Example 1:

Input: [-1, 0, 2, 3], target=3
Output: 2
Explanation: There are two triplets whose sum is less than the target: [-1, 0, 3], [-1, 0, 2]

## Example 2:

Input: [-1, 4, 2, 1, 3], target=5
Output: 4
Explanation: There are four triplets whose sum is less than the target:
   [-1, 1, 4], [-1, 1, 3], [-1, 1, 2], [-1, 2, 3]

 */

func findTriplet(_ array: [Int], target: Int) -> Int {
    var array = array.sorted()
    var result = 0

    for i in 0..<array.count - 2 {
        var leftP = i + 1
        var rightP = array.count - 1

        while leftP < rightP {
            let tripletSum = array[i] + array[leftP] + array[rightP]
            if tripletSum < target {
                // If sum of triplet is less than target, all triplets between left and right are valid
                result += rightP - leftP
                
                leftP += 1
            } else {
                rightP -= 1
            }
        }
    }
    return result
}

findTriplet([-1, 4, 2, 1, 3], target: 5)
