/*
 Problem 844: Backspace String Compare (Easy)

 Given two strings `s` and `t`, return **true** if they are equal when both are typed into
 empty text editors. The `#` character represents a **backspace**.

 **Important Note**:
 If the text is empty and a backspace is applied, the text will remain **empty**.

 **Example 1**:
 Input: `s = "ab#c"`, `t = "ad#c"`
 Output: `true`
 Explanation:
 - After applying the backspace, both `s` and `t` become `"ac"`.

 **Example 2**:
 Input: `s = "ab##"`, `t = "c#d#"`
 Output: `true`
 Explanation:
 - After applying the backspaces, both `s` and `t` become empty strings `""`.

 **Example 3**:
 Input: `s = "a#c"`, `t = "b"`
 Output: `false`
 Explanation:
 - After applying the backspace, `s` becomes `"c"`, but `t` becomes `"b"`. They are not equal.

 **Constraints**:
 - `1 <= s.length, t.length <= 200`
 - Both `s` and `t` only contain **lowercase letters** and `#` characters.

 **Follow-up**:
 Can you solve the problem in **O(n)** time and **O(1)** space?
 */

func backspaceCompare(_ s: String, _ t: String) -> Bool {
    // S String
    var sArray: [Character] = Array(s)
    var sPointer = sArray.count - 1

    // T String
    var tArray: [Character] = Array(t)
    var tPointer = tArray.count - 1

    while sPointer >= 0 || tPointer >= 0 {
        var nextSElement = getNextValidCharacter(array: sArray, index: &sPointer)
        var nextTElement = getNextValidCharacter(array: tArray, index: &tPointer)

        if nextSElement < 0 && nextTElement < 0 {
            return true
        }

        if nextSElement < 0 || nextTElement < 0 {
            return false
        }

        if sArray[nextSElement] != tArray[nextTElement] {
            return false
        }

        sPointer = nextSElement - 1
        tPointer = nextTElement - 1
    }

    return true
}

func getNextValidCharacter(array: [Character], index: inout Int) -> Int {
    var skipsCount = 0
    while index >= 0 {
        if array[index] == "#" {
            skipsCount += 1
        } else if skipsCount > 0 {
            skipsCount -= 1
        } else {
            break
        }
        index -= 1
    }
    return index
}

backspaceCompare("a#c", "b")
