import XCTest
import Foundation

/*
    Leetcode #15: 3 Sum
    
    Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

    Notice that the solution set must not contain duplicate triplets.
 
    Example:

    Input: nums = [-1,0,1,2,-1,-4]
    Output: [[-1,-1,2],[-1,0,1]]
 
 
    Solution:
         1. check input has at least 3 values else return [] if false
         2. sort the array
         3. result array will be a set<[Int]>
         4. outer loop controls indexing of first number
             - x = idx[0]
             - left pointer idx[1]
             - right pointer idx[last]
             5. inner while loop to find 2 matching nums + the first
                6. use control logic for the following:
                    - the sum of 3 numbers equals target store values into Set
                    - sum is greater than total move right pointer to the left by 1
                    - sum is less than total move the left pointer to the right by 1
        7. return the results array once loops have completed
 
 Time:
    - sorting of the array is a O(n log n)
    - nested loops being used is O(n^2)
    - Overall time is O(n^2)
 
 Space: O(N)
        
        
 
 */

let a = [-1, 0, 1, 2, -1, -4]

func threeSumNum(_ nums: [Int]) -> [[Int]]{
    guard nums.count >= 3 else { return [] }
    var result = Set<[Int]>()
    let sorted = nums.sorted()
    
    for idx in 0..<sorted.count-1{
        let x = sorted[idx]
        var left = idx+1
        var right = sorted.count-1
        
        while (left < right){
            let sum = x + sorted[left] + sorted[right]
            if sum == 0{
                let solution = [x, sorted[left], sorted[right]]
                result.insert(solution)
                left += 1
                right -= 1
            }
            else if sum < 0 {
                left += 1
            }
            else{
                right -= 1
            }
        }
    }
    
    return Array(result)
    
}

class TestCase: XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(threeSumNum(a), [[-1,-1,2],[-1,0,1]])
    }
}

TestCase.defaultTestSuite.run()

