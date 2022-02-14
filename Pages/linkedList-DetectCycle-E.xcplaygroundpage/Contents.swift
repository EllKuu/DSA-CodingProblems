import Foundation

/*
 Leetcode 141: Linked List Cycle - easy
 
 Given head, the head of a linked list, determine if the linked list has a cycle in it.
 
 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
 
 Return true if there is a cycle in the linked list. Otherwise, return false.
 
 Solution:
 - use the fast and slow approach
 - setup a fast and slow pointer at the head of the linked list
 - the fast pointer will be 1 node ahead of the slow pointer
 - a while loop will continue as long as the fast pointers next is not nil
 - eventually the fast and slow pointer will meet if there is a cycle in the LL
 
 sf
 1 -> 2 -> 3
 ^---------|
 
      s    f
 1 -> 2 -> 3
 ^---------|
 
      f    s
 1 -> 2 -> 3
 ^---------|
 
 sf
 1 -> 2 -> 3
 ^---------|
 
 Time: O(n)
 Space: O(1)
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func hasCycle(_ head: ListNode?) -> Bool{
    var fast = head
    var slow = head
    
    while fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if (fast === slow) { return true }
    }
    
    return false
}

