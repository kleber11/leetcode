/**
 # 11. Container With Most Water

 **Difficulty:** Medium

 ---

 ## Problem:

 You are given an integer array `height` of length `n`. There are `n` vertical lines drawn such that the two endpoints of the `i-th` line are `(i, 0)` and `(i, height[i])`.

 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the **maximum amount of water** a container can store.

 **Notice:** You may not slant the container.

 ---

 ## Example 1:

 - **Input:** `height = [1, 8, 6, 2, 5, 4, 8, 3, 7]`
 - **Output:** `49`

 **Explanation:** The above vertical lines are represented by the array `[1, 8, 6, 2, 5, 4, 8, 3, 7]`. In this case, the maximum area of water (blue section) the container can contain is `49`.

 ---

 ## Example 2:

 - **Input:** `height = [1, 1]`
 - **Output:** `1`

 ---

 ## Constraints:

 - `n == height.length`
 - `2 <= n <= 10^5`
 - `0 <= height[i] <= 10^4`

 */

func maxArea(_ height: [Int]) -> Int {
    var leftP = 0 // First pointer
    var rightP = height.count - 1 // Second pointer
    var containerSize = 0 // The total size of container

    while leftP < rightP {
        // Calculate diff between pointers
        let distance = rightP - leftP
        let smallestHeight: Int = min(height[leftP], height[rightP])
        let size = distance * smallestHeight
        containerSize = max(containerSize, size)

        if height[leftP] < height[rightP] {
            leftP += 1
        } else {
            rightP -= 1
        }
    }

    return containerSize
}

print(maxArea([1, 3, 2, 5, 25, 24, 5]))
