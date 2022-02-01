import XCTest
import Foundation

/*
    Leetcode 33: Search in a rotated sorted array - Medium
 
     There is an integer array nums sorted in ascending order (with distinct values).

     Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

     Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

     You must write an algorithm with O(log n) runtime complexity.

     Example 1:

     Input: nums = [4,5,6,7,0,1,2], target = 0
     Output: 4
     
     Example 2:

     Input: nums = [4,5,6,7,0,1,2], target = 3
     Output: -1
     
     Example 3:

     Input: nums = [1], target = 0
     Output: -1
 
    Solution: Using the concept of a binary search to see if target exists in a rotated sorted array.
 
        - find the mid point of the array and check if it matches the target
        - check if left most element up to the mid point is sorted
            - we check if target is in our left range and adjust the left and right pointers
        - if left side isnt sorted than we know the right side is sorted from mid to right most element
            - we are checking for our target in the right side and adjusting the left and right pointers
 
    Time: O(log n)
    Space: O(1)
 
*/

func searchFast(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        guard n > 0 else { return -1 }
        var left = 0
        var right = n-1
        
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target { return mid }
            
            if nums[left] <= nums[mid] { //[left...mid] is sorted
                if target >= nums[left] && target < nums[mid] {
                    right = mid-1
                } else {
                    left = mid + 1
                }
            } else { // nums[mid] <= nums[right] //[mid...right] is sorted
                if target > nums[mid] && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }

let a = [4,5,6,7,0,1,2]
let b = [6,7,0,1,2,4,5]

class TestCase:XCTestCase{
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(searchFast(a, 0), 4)
        XCTAssertEqual(searchFast(a, 3), -1)
        XCTAssertEqual(searchFast(b, 0), 2)
    }
}

TestCase.defaultTestSuite.run()
