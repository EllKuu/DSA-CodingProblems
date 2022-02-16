import Foundation

/*
 Leetcode 143: Reorder list
 
 You are given the head of a singly linked-list. The list can be represented as:
 
 L0 → L1 → … → Ln - 1 → Ln
 Reorder the list to be on the following form:
 
 L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
 You may not modify the values in the list's nodes. Only nodes themselves may be changed.
 
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// using stack
// Time: O(n) Space: O(n)
func reorderList(_ head: ListNode?) {
        var node = head, stack = [node]
        while let next = node?.next {
            stack.append(next)
            node = next
        }
        
        node = head
        while let next = node?.next, let endNode = stack.removeLast() {
            node?.next = endNode
            endNode.next = next
            
            node = next
            
            if node?.next === endNode {
                node?.next = nil
                break
            }
        }
    }

// using array
// Time: O(n) Space: O(n)
func reorderListArr(_ head: ListNode?) {
      var nodes: [ListNode] = []
      var current: ListNode? = head
      
      while let c = current {
        nodes.append(c)
        current = c.next
        c.next = nil
      }
      
      current = ListNode(-1)
      
      var l = 0
      var r = nodes.count-1
      
      while l < r {
        current?.next = nodes[l]
        current = current?.next
        current?.next = nodes[r]
        current = current?.next
        l += 1
        r -= 1
      }
      
      current?.next = l == r ? nodes[l] : nil
    }

// using fast and slow pointers
// Time: O(n) Space: O(1)
func reorderList1(_ head: ListNode?) {
        if head == nil {
            return
        }
        
        var slow = head
        var fast = head?.next
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        var prev: ListNode? = nil
        var curr = slow
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        var first = head
        var second = prev
        while second?.next != nil {
            var tmp = first?.next
            first?.next = second
            first = tmp
            
            tmp = second?.next
            second?.next = first
            second = tmp
        }
    }

