import Foundation

/*
    Leetcode 450: Delete a node in a BST
 
 Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

 Basically, the deletion can be divided into two stages:

 Search for a node to remove.
 If the node is found, delete the node.
 
 Example 1:

 Input: root = [5,3,6,2,4,null,7], key = 3
 Output: [5,4,6,2,null,null,7]
 Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
 One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
 Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.
 
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// Recursive
// Time: O(n), Space: O(h) - h is the height of the tree
func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let root = root else { return nil }
    
    if key < root.val{
        root.left = deleteNode(root.left, key)
    }
    else if key > root.val{
        root.right = deleteNode(root.right, key)
    }
    else{
        if root.left == nil {
            return root.right
        }
        else if root.right == nil {
            return root.left
        }
        let minNode = findMin(root.right)
        root.val = minNode!.val
        root.right = deleteNode(root.right, root.val)
    }
    return root
    
}

func findMin(_ root: TreeNode?) -> TreeNode?{
    var next = root
    while next?.left != nil {
        next = next?.left
    }
    return next
    
}

/*
ITERATIVE
Time Complexity: O(N)
Space Complexity: O(1)
*/
    func deleteNodeItr(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        
        var current = root
        var pre: TreeNode?
        
        while current != nil && current!.val != key {
            pre = current
            if current!.val < key {
                current = current?.right
            } else {
                current = current?.left
            }
        }
        
        if pre == nil {
            return deleteRoot(current)
        }
        
        if pre?.left == current {
            pre?.left = deleteRoot(current)
        } else if pre?.right == current {
            pre?.right = deleteRoot(current)
        }
        
        return root
    }
    
    func deleteRoot(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        if root.left == nil {
            return root.right
        }
        
        if root.right == nil {
            return root.left
        }
        
        var next = root.right
        var pre: TreeNode?
        
        while next?.left != nil {
            pre = next
            next = next?.left
        }
        next?.left = root.left
        if next != root.right {
            pre?.left = next?.right
            next?.right = root.right
            
        }
        
        return next
    }
    
    
extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return (lhs.left == rhs.left) && (lhs.right == rhs.right) && (lhs.val == rhs.val)
    }
}
