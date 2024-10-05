/**
  Problem: Boats to Save People
  LeetCode: Problem 881 (Medium)

  You are given an array `people` where `people[i]` is the weight of the ith person,
  and an infinite number of boats where each boat can carry a maximum weight of `limit`.
  Each boat carries at most two people at the same time, provided the sum of the weight
  of those people is at most `limit`.

  Your task is to return the minimum number of boats needed to carry every person.

  Example 1:
  Input: people = [1, 2], limit = 3
  Output: 1
  Explanation: One boat can carry both person 1 (weight 1) and person 2 (weight 2), since 1 + 2 <= 3.

  Example 2:
  Input: people = [3, 2, 2, 1], limit = 3
  Output: 3
  Explanation: Three boats are needed: (1, 2), (2), (3).

  Example 3:
  Input: people = [3, 5, 3, 4], limit = 5
  Output: 4
  Explanation: Four boats are needed: (3), (3), (4), (5).

  Constraints:
  - 1 <= people.length <= 50,000
  - 1 <= people[i] <= limit <= 30,000
*/

func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
    var people = people.sorted()
    var boats = 0
    var leftP = 0
    var rightP = people.count - 1

    while leftP <= rightP {
        if people[rightP] + people[leftP] > limit {
            rightP -= 1
        } else {
            leftP += 1
            rightP -= 1
        }
        boats += 1
    }
    return boats
}

print(numRescueBoats([3, 5, 3, 4], 5))

// Space Complexity: O(1)
// Time Complexity: O(N * logN)
