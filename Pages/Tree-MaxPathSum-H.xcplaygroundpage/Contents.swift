import XCTest
import Foundation

/*
 Leetcode 124: Binary Tree Max Path Sum
 
 A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.
 
 The path sum of a path is the sum of the node's values in the path.
 
 Given the root of a binary tree, return the maximum path sum of any non-empty path.
 
 Input: root = [1,2,3]
 Output: 6
 Explanation: The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.
 
 Input: root = [-10,9,20,null,null,15,7]
 Output: 42
 Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.
 
 Time: O(n)
 Space: O(h) - h is height of the tree
 
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

let a = TreeNode(1)
let b = TreeNode(2)
let c = TreeNode(3)
a.left = b
a.right = c

var globalMax = Int.min

func maxPathSum(_ root: TreeNode?) -> Int {
    maxPath(root)
    return globalMax
}

func maxPath(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    let currVal = root.val
    let left = max(0, maxPath(root.left))
    let right = max(0, maxPath(root.right))
    globalMax = max(globalMax, left + currVal + right)
    return max(left, right) + currVal
}

class Test:XCTestCase{
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(maxPathSum(a), 6)
    }
}

Test.defaultTestSuite.run()
