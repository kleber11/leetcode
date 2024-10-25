/**
 ## LeetCode Problem 744: Find Smallest Letter Greater Than Target
 https://leetcode.com/problems/find-smallest-letter-greater-than-target/

 You are given an array of characters `letters` that is sorted in `non-decreasing order`, and a character target. There are `at least two different` characters in letters.

 Return the **smallest** character in `letters` that is **lexicographically greater than** `target`. If such a character does not exist, return the first character in `letters`.

 Constraints:
 - The input array `letters` has a length between 2 and 10^4.
 - Each element in `letters` is a lowercase English letter.
 - The `letters` array is sorted in non-decreasing order.
 - The target is a lowercase English letter.

 Example:
 Input: letters = ["c", "f", "j"], target = "a" Output: "c"
 */

func alphabetPositionLowercase(of character: Character) -> Int? {
    guard let unicodeValue = character.asciiValue, character.isLowercase else {
        return nil // Return nil if the character is not lowercase
    }
    return Int(unicodeValue) - Int(Character("a").asciiValue!) + 1
}

 func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
     var startP = 0
     var endP = letters.count - 1

     while startP <= endP {
         let mid = startP + (endP - startP) / 2
         if alphabetPositionLowercase(of: letters[mid])! <= alphabetPositionLowercase(of: target)! {
             startP = mid + 1
         } else {
             endP = mid - 1
         }
     }

     return startP >= letters.count ? letters[0] : letters[startP]
 }
nextGreatestLetter(["e","e","e","e","e","e","n","n","n","n"], "e") // n
nextGreatestLetter(["e","e","g","g"], "g") // e
nextGreatestLetter( ["c", "f", "j"], "c") // f
nextGreatestLetter(["c","f","j"], "d") // f
nextGreatestLetter(["x","x","y","y"], "z") // x
nextGreatestLetter(["c","f","j"], "a") // c
nextGreatestLetter(["c","f","j"], "j") // c
