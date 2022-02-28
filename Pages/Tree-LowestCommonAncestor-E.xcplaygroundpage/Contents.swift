import XCTest
import Foundation

/*
    Leetcode 235: Lowest Common Ancestor of Binary Search Tree - Easy
 
 Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.

 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
 
    - "Binary Search Tree" values on left are less than root value and values on right are greater than root value.
    -
 
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

extension TreeNode: Equatable {
        public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
            return (lhs.val == rhs.val) && (lhs.left == rhs.left) && (lhs.right == rhs.right)
        }
    }


let a = TreeNode(6)
let b = TreeNode(2)
let c = TreeNode(8)
let d = TreeNode(0)
let e = TreeNode(4)
let f = TreeNode(7)
let g = TreeNode(9)
let h = TreeNode(3)
let i = TreeNode(5)
a.left = b
a.right = c
b.left = d
b.right = e
c.left = f
c.right = g
e.left = h
e.right = i

//Iterative: (OPTIMAL)
//Time Complexity: O(N)
//Space Complexity: O(1)

   func lowestCommonAncestorIter(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
       var current = root
       if current == p || current == q { return current }
       while current != nil {
           if (p!.val < current!.val && q!.val < current!.val) {
               current = current?.left
           } else if (p!.val > current!.val && q!.val > current!.val) {
               current = current?.right
           } else {
               return current
           }
        }
       return current
   }

//Recursive:
//Time Complexity: O(N)
//Space Complexity: O(N), worst O(H) - average, O(logN) - Best
   
    func lowestCommonAncestorRecur(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
       guard let root = root else {
           return nil
       }
       if root == p || root == q { return root }
       if (p!.val < root.val && q!.val < root.val) {
           return lowestCommonAncestorRecur(root.left, p, q)
       }else if (p!.val > root.val && q!.val > root.val) {
           return lowestCommonAncestorRecur(root.right, p, q)
       } else {
           return root
       }
   }

class Test: XCTestCase{
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(lowestCommonAncestorIter(a, b, c), a)
    }
    
    func test1(){
        XCTAssertEqual(lowestCommonAncestorIter(a, b, e), b)
    }
    
    func test2(){
        XCTAssertEqual(lowestCommonAncestorIter(a, e, f), a)
    }
    
    func test3(){
        XCTAssertEqual(lowestCommonAncestorIter(a, f, i), a)
    }
    
}

Test.defaultTestSuite.run()
