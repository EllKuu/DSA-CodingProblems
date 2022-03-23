import Foundation

/*
 Leetcode 56. Merge Intervals - Medium
 
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
 
 Example 1:
 
 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:
 
 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 
 Time: O(nlogn) - sort the array first by start times
 
 */

func merge(_ intervals: [[Int]]) -> [[Int]] {
    
    let sorted = intervals.sorted(by: {$0[0] < $1[0]})
    
    guard let first = sorted.first else { return [[Int]]() }
    var merged = [first]
    
    for current in sorted {
        guard let last = merged.last else { continue }
        
        let prevStart = last[0]
        let prevEnd = last[1]
        
        let start = current[0]
        let end = current[1]
        
        if prevEnd >= start {
            merged[merged.count - 1] = [prevStart, max(prevEnd, end)]
        } else {
            merged.append(current)
        }
    }
    return merged
}

var inter = [[1,3],[2,6],[8,10],[15,18]]

merge(inter)
