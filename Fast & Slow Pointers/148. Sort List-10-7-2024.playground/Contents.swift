/**
 ## 148. Sort List

 **Medium**

 **Topics:** Linked List, Sorting

 Given the **head** of a linked list, return the list after sorting it in **ascending order**.

 ## Example 1:
 **Input:** `head = [4,2,1,3]`
 **Output:** `[1,2,3,4]`

 ## Example 2:
 **Input:** `head = [-1,5,3,4,0]`
 **Output:** `[-1,0,3,4,5]`

 ## Example 3:
 **Input:** `head = []`
 **Output:** `[]`

 ## Constraints:
 - The number of nodes in the list is in the range **[0, 5 * 10^4]**.
 - **-10^5 <= Node.val <= 10^5**

 ## Follow up:
 Can you sort the linked list in **O(n log n)** time and **O(1)** memory (i.e., constant space)?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func sortList(_ head: ListNode?) -> ListNode? {

    return head
}
