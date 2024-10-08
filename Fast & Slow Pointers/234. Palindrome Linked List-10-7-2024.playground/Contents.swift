/**
 ## 234. Palindrome Linked List

 **Easy**

 **Topics:** Linked List

 Given the head of a singly linked list, return **true** if it is a
 **palindrome** or **false** otherwise.

 ## Example 1:
 **Input:** `head = [1,2,2,1]`
 **Output:** `true`

 ## Example 2:
 **Input:** `head = [1,2]`
 **Output:** `false`

 ## Constraints:
 - The number of nodes in the list is in the range **[1, 10^5]**.
 - **0 <= Node.val <= 9**

 ## Follow up:
 Could you do it in **O(n)** time and **O(1)** space?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func isPalindrome(_ head: ListNode?) -> Bool {
    guard head != nil, head?.next != nil else { return true }
    // Initialize `fast` and `slow` pointers
    var fastP = head
    var slowP = head

    // Iterate throught list and determine
    // where the second half of list begins
    while fastP != nil, fastP?.next != nil {
        fastP = fastP?.next?.next
        slowP = slowP?.next
    }

    // Once above loop has finished, we can reverse
    // second part of list where `slowP` ended up
    var reversedList = reverseLinkedList(slowP)
    var initialListP = head

    // Iterate through both lists and compare its values
    while reversedList != nil {
        if initialListP?.val != reversedList?.val {
            return false
        }
        reversedList = reversedList?.next
        initialListP = initialListP?.next
    }
    return true
}

func reverseLinkedList(_ listNode: ListNode?) -> ListNode? {
    var current = listNode
    var prev: ListNode? = nil
    while current != nil {
        let next = current?.next
        current?.next = prev
        prev = current
        current = next
    }
    return prev
}

let node = ListNode(1, .init(2, .init(3, .init(3, .init(2, .init(2))))))
isPalindrome(node)
