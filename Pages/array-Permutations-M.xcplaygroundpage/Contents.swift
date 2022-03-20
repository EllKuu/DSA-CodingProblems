import Foundation
/*
 Leetcode 46: Permutations - Medium
 
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.
 
 Example 1:
 
 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 Example 2:
 
 Input: nums = [0,1]
 Output: [[0,1],[1,0]]
 Example 3:
 
 Input: nums = [1]
 Output: [[1]]
 
 */

func permute(_ nums: [Int]) -> [[Int]] {
    if nums.count == 1 { return [nums] }
    var res = [[Int]]()
    
    for i in 0..<nums.count {
        print("i: \(i)")
        var tmp = nums
        print("tmp: \(tmp)")
        let n = tmp.remove(at: i)
        print("n: \(n)")
        print("tmp After: \(tmp)")
        for arr in permute(tmp) {
            print("arr: \(arr)")
            res.append([n] + arr)
            print("res: \(res)")
            print("------------")
        }
    }
    return res
}

permute([1, 2, 3])

