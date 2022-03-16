import XCTest
import Foundation

/*
 Leetcode 18: 4Sum - Medium
 
 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:
 
 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.
 
 
 
 Example 1:
 
 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 
 Time: O(n^3)
 Space: O(n)
 
 */

// using 3 loops
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    
    let len = nums.count
    guard len >= 4 else { return [] }
    
    var result = [[Int]]()
    let sort = nums.sorted()
    
    for a in 0..<(len - 1) where a == 0 || sort[a] != sort[a-1] {
        for b in (a + 1)..<len where b == a + 1 || sort[b] != sort[b-1] {
            var c = b + 1, d = len - 1
            while c < d {
                let val = (a: sort[a], b: sort[b], c: sort[c], d: sort[d])
                let sum = (val.a + val.b + val.c + val.d)
                if sum == target { result.append([val.a,val.b,val.c,val.d]) }
                if sum < target {
                    while sort[c] == val.c, c < d { c += 1 }
                } else {
                    while sort[d] == val.d, d > b { d -= 1 }
                }
            }
        }
    }
    return result
}

// using recursion
func four_Sum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let len = nums.count
    guard len >= 4 else { return [] }
    
    var result = [[Int]]()
    var quad = [Int]()
    let sort = nums.sorted()
    
    func kSum(_ k: Int, _ start: Int, _ target: Int){
        if k != 2{
            for i in start..<len-k+1{
                if i > start && sort[i] == sort[i-1] { continue }
                quad.append(sort[i])
                kSum(k - 1, i + 1, target - sort[i])
                quad.popLast()
            }
            return
        }
        // base case two sum II
        var left = start
        var right = len - 1
        while left < right{
            if sort[left] + sort[right] < target{
                left += 1
            }
            else if sort[left] + sort[right] > target{
                right -= 1
            }
            else{
                result.append(quad + [sort[left], sort[right]])
                left += 1
                while left < right,  sort[left] == sort[left-1]{
                    left += 1
                }
            }
        }
    }
    
    kSum(4, 0, target)
    
    return result
}
