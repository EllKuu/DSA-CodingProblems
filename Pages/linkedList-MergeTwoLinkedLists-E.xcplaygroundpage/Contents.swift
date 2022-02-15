import Foundation

/*
    Leetcode 21: Merge two sorted lists - Easy
 
    You are given the heads of two sorted linked lists list1 and list2.

    Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

    Return the head of the merged linked list.
 
 */


// Time: O(n) Space: O(1)
func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        if list1 == nil && list2 == nil { return nil }
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        
        var l = ListNode(0)
        var p = l
        var l1 = list1
        var l2 = list2
    
        while(l1 != nil && l2 != nil) {
            if(l1!.val < l2!.val) {
                p.next = l1
                l1 = l1!.next
            }
            else {
                p.next = l2
                l2 = l2!.next
            }
            p = p.next!
        }
    
        if(l1 != nil) {
            p.next = l1!
        }
        if(l2 != nil) {
            p.next = l2!
        }
        
        return l.next
        
    }

// Time: O(n) Space O(n)
func mergeTwoListsRecursive(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if list1 == nil && list2 == nil { return nil }
        if(l1 == nil) {return l2}
        if(l2 == nil) {return l1}
    
        var result:ListNode?
        
        if(l1!.val <= l2!.val) {
            result = l1
            result!.next = mergeTwoListsRecursive(l1!.next,l2)
        }
        else {
            result = l2
            result!.next = mergeTwoListsRecursive(l1,l2!.next)
        }
        return result
    }
