import Foundation

/*
    Leetcode 701: Insert into a binary search tree - Medium
 
 You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.

 Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.
 
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

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let root = root else { return TreeNode(val) }
    
    // going left
    if root.val > val{
        if root.left == nil{
            root.left = TreeNode(val)
        }else{
            insertIntoBST(root.left, val)
        }
       
    }
    // going right
    else{
        if root.right == nil{
            root.right = TreeNode(val)
        }else{
            insertIntoBST(root.right, val)
        }
    }
    
    return root
}
