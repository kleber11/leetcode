/**
 ## 383. Ransom Note
 [LeetCode Problem 383](https://leetcode.com/problems/ransom-note/)

 This function determines if the `ransomNote` can be constructed using the characters from the `magazine`.
 Each character in the magazine can only be used once.

 - Parameters:
   - ransomNote: A string representing the ransom note we are trying to construct.
   - magazine: A string representing the available characters from which we can build the ransom note.

 - Returns: A Boolean value indicating whether the `ransomNote` can be constructed from the `magazine`.
 */

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var bag: [Character: Int] = [:]
    for element in ransomNote {
        bag[element, default: 0] += 1
    }

    var magazineConverted = Array(magazine)
    var i = 0
    while i < magazineConverted.count {
        let element = magazineConverted[i]
        if var element2 = bag[element] {
            bag[element]! -= 1
            if bag[element]! == 0 {
                bag.removeValue(forKey: magazineConverted[i])
            }
        }
        i += 1
    }
    return bag.isEmpty
}

