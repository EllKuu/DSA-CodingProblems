import XCTest
import Foundation

/*
    Leetcode 424. Longest Repeating Character Replacement - Medium
 
    You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.

    Return the length of the longest substring containing the same letter you can get after performing the above operations.

     Example 1:

     Input: s = "ABAB", k = 2
     Output: 4
     Explanation: Replace the two 'A's with two 'B's or vice versa.
     Example 2:

     Input: s = "AABABBA", k = 1
     Output: 4
     Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
     The substring "BBBB" has the longest repeating letters, which is 4.
 
 
    Solution 1:
        - sliding window and using a map to keep track of [char:int]
    
    Walkthrough
        "ABABBA"
         ^
    - we have a start pointer that will be used for our sliding window
    - we then begin our loop and go through the following cases
        - adding our current element to our map (check if char is in our map and add to its count)
        - we now have to check if our window length minus our maps greatest count value is greater than the 'k'
            - if it the condition is true we have to minus the count of the starts element in our map and move the        start pointer up 1 thus moving our window
            
            "ABABBA"
              ^
 
            - the maxLen is then determined by our window length
    - the loop completes when we have gone through all the characters and the maxLen is returned
        
 
    Time: O(26n) which can simplfy to O(n)
        - we have O(26n) because our map can have 26 characters of the alphabet which means we have to go through our   map each time checking for the max count
    Space: O(n)
 
*/



func longRepeat1(_ s: String, _ k: Int) -> Int {
    
    var map = [Character:Int]()
    var maxLen = 0
    var start = 0
    let s = Array(s)
    
    for (end, char) in s.enumerated(){
        
        map[char, default: 0] += 1
    
        if(end - start + 1 - map.values.max()! > k){
            let key = s[start]
            map[key]! -= 1
            start += 1
        }
        
        maxLen = max(end-start+1 , maxLen)
    }
    return maxLen
}


/*
    Solution 2:
 
    similar to solution 1 but we can keep track of the max repeating character count of the character that was just added to our map as it might be that character is the most frequent. Keeping track of the maxRepeatChar is a constant time operation and thus speeds up our algorithm.
 */

func longRepeat2(_ s: String, _ k: Int) -> Int {
    
    var map = [Character:Int]()
    var maxRepeatChar = 0
    var maxLen = 0
    var start = 0
    let s = Array(s)
    
    for (end, char) in s.enumerated(){
        
        map[char, default: 0] += 1
        maxRepeatChar = max(maxRepeatChar, map[char]!)
    
        if(end - start + 1 - maxRepeatChar  > k){
            let key = s[start]
            map[key]! -= 1
            start += 1
        }

        maxLen = max(end-start+1 , maxLen)
    }
    return maxLen
}

let str = "ABABBA"
let k = 2

class TestCase: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(longRepeat1(str, k), 5)
        XCTAssertEqual(longRepeat2(str, k), 5)
    }
}

TestCase.defaultTestSuite.run()
