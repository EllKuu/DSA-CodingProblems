import XCTest
import Foundation

/*
    Leetcode 105: Construct a binary tree from preorder and inorder traversal - Medium
 
    Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.
 
    1. Use the preorder array to determine the root
    2. Use the inorder array to determine how to partition the preorder array by finding the root and identifying the left and right subtree values
 
    Time: O(n)
    Space: O(n)
 */

public class TreeNode {
    public var val: Int?
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = nil; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

let a = TreeNode(3)
let b = TreeNode(9)
let c = TreeNode(20)
let d = TreeNode(15)
let e = TreeNode(7)
a.left = b
a.right = c
c.left = d
c.right = e

// In order traversal left, root, right

func inOrderTraversalRecursive(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    guard let root = root else {
        return []
    }
    
    let leftValues = inOrderTraversalRecursive(root.left)
    let rightValues = inOrderTraversalRecursive(root.right)
   
    result.append(contentsOf: leftValues)
    result.append(root.val!)
    result.append(contentsOf: rightValues)
    return result
}

print("In order: \(inOrderTraversalRecursive(a))")

// pre order traversal root, left, right

func preOrderTraversalRecursive(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    guard let root = root else {
        return []
    }
    
    let leftValues = preOrderTraversalRecursive(root.left)
    let rightValues = preOrderTraversalRecursive(root.right)
   
    result.append(root.val!)
    result.append(contentsOf: leftValues)
    result.append(contentsOf: rightValues)
    return result
}

print("Pre: \(preOrderTraversalRecursive(a))")

func depthTraversalRecursive(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    guard let root = root else {
        return []
    }
    
    let leftValues = depthTraversalRecursive(root.left)
    let rightValues = depthTraversalRecursive(root.right)
   
    result.append(root.val!)
    result.append(contentsOf: leftValues)
    result.append(contentsOf: rightValues)
    return result
}


// Function for building a tree from Preorder and Inorder array sequences 
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.isEmpty || inorder.isEmpty { return nil }
           
    let root = TreeNode(preorder[0])
    if let mid = inorder.firstIndex(of: preorder[0]) {
        if mid >= 1 {
            root.left = buildTree(Array(preorder[1...mid]), Array(inorder[0..<mid]))
        }
        root.right = buildTree(Array(preorder[mid + 1..<preorder.count]), Array(inorder[mid + 1..<inorder.count]))
    }
    
    return root
    
}

depthTraversalRecursive(buildTree([3,9,20,15,7], [9,3,15,20,7]))

