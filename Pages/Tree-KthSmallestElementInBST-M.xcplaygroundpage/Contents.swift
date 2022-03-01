import XCTest
import Foundation

/*
 Leetcode 230: Kth Smallest Element in BST - M
 
 Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.
 
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

let a = TreeNode(3)
let b = TreeNode(1)
let c = TreeNode(4)
let d = TreeNode(2)
a.left = b
a.right = c
b.right = d

/*
    Iterative solution
    - use a stack and visit every node that is left add it to the stack until left pointer is nil
    - remove a node from the top of the stack and process it
        - decrease our count and if count == k return the nodes value
    - otherwise traverse down the removed nodes right pointer and check its left pointer until its nil
 
 
    Time: O(n), Space: O(n)
 */

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int{
    var stack = [TreeNode]()
    var count = k
    var root = root
    
    while root != nil {
        stack.append(root!)
        root = root?.left
    }
    
    while count != 0 {
        let node = stack.removeLast()
        count -= 1
        if count == 0 {
            return node.val
        }
        var rightNode = node.right
        while rightNode != nil {
            stack.append(rightNode!)
            rightNode = rightNode?.left
        }
    }
    
    return -1
}


class test:XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(kthSmallest(a, 1), 1)
        XCTAssertEqual(kthSmallest(a, 4), 4)
    }
}

test.defaultTestSuite.run()
