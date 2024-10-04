/**
 # 83. Remove Duplicates from Sorted List
 ## Difficulty: Easy

 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

 ## Examples:

 ### Example 1:
 - **Input:** head = [1,1,2]
 - **Output:** [1,2]

 ### Example 2:
 - **Input:** head = [1,1,2,3,3]
 - **Output:** [1,2,3]

 ## Constraints:
 - The number of nodes in the list is in the range [0, 300].
 - Node values range between -100 <= Node.val <= 100.
 - The list is guaranteed to be sorted in ascending order.

 ## Important Notes:
 - Since the list is sorted, any duplicates will always be adjacent.
 - The solution should modify the linked list in-place by iterating and removing any nodes that are duplicates of the previous one.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var current = head
    while current != nil && current?.next != nil {
        if current?.val == current?.next?.val {
            current?.next = current?.next?.next
        } else {
            current = current?.next
        }
    }
    return head
}

let head = ListNode(1, .init(1, .init(2)))
print(deleteDuplicates(head))
