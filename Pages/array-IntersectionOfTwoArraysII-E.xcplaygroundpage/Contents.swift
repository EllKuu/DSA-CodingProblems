import Foundation
import XCTest

/*
    Leetcode 350: Intersection of two arrays - Easy
 
 Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

 Example 1:

 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 Example 2:

 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 Explanation: [9,4] is also accepted.
 
 Follow up:

 What if the given array is already sorted? How would you optimize your algorithm?
  - use the pointer solution without the sorting of the arrays at the first step
 
 What if nums1's size is small compared to nums2's size? Which algorithm is better?
  - We can swap nums1 and nums2 so that the hashmap is built from the smaller array
 
 What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
  - We can split nums2 into smaller chunks and use the hashmap of nums1 to compare for intersected numbers in nums2
 
 
 
 */

/*
    Time: O(n + m) - we have to go through each arrays elements once
    n is length of nums2
    m is length of nums1
 
    Space: O(min(m, n))
    the size of the smaller of the two arrays
    
 */
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    if nums1.count > nums2.count {
        return intersect(nums2, nums1)
    }
    
    var dict = [Int:Int]()
    var result = [Int]()
    
    for num in nums1{
        if let i = dict[num]{
            dict[num] = i + 1
        }else{
            dict[num] = 1
        }
        
    }
    
    for num in nums2{
        if let i = dict[num]{
            dict[num] = i - 1
            if i - 1 >= 0{
                result.append(num)
            }
        }
    }
    
    return result
    
}
/*
    Time: O(mlogm + nlogn)
    - sorting takes the longest time
 
    Space: O(1)
 
 */
func intersect_TwoPointers(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1 = nums1.sorted()
        let nums2 = nums2.sorted()
        let n1 = nums1.count
        let n2 = nums2.count
        var i1 = 0
        var i2 = 0
        var result = [Int]()
        
        while i1 < n1 && i2 < n2 {
            if nums1[i1] == nums2[i2] {
                result.append(nums1[i1])
                i1 += 1
                i2 += 1
            } else if nums1[i1] > nums2[i2] {
                i2 += 1
            } else {
                i1 += 1
            }
        }
        
        return result
    }

