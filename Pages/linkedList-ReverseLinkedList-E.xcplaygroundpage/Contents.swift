import XCTest
import Foundation

/*
    Leetcode 206: Reverse Linked List - Easy
 
 Given the head of a singly linked list, reverse the list, and return the reversed list.
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// Iteratively
// Time: O(n) Space: O(1)
func reverseList(_ head: ListNode?) -> ListNode? {
    
    // 1. create 3 pointers
    var prev: ListNode?
    var current = head
    var following = head
    
    // 2. loop
    while current != nil{
        following = following?.next
        current?.next = prev
        prev = current
        current = following
    }
    
    return prev
    
}


// recursively
// Time: O(n) Space: O(n)
func recursiveReverseList(_ head: ListNode?) -> ListNode? {
    
    guard let head = head else {
            return nil
        }

        guard let next = head.next else {
            return head
        }

        let headNew = recursiveReverseList(next)
        next.next = head
        head.next = nil

        return headNew
    
}
