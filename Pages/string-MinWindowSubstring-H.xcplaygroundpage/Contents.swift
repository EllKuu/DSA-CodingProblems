import XCTest
import Foundation

/*
    Leetcode 76: Min Window Substring - Hard
 
     Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

     The testcases will be generated such that the answer is unique.

     A substring is a contiguous sequence of characters within the string.

     Example 1:

     Input: s = "ADOBECODEBANC", t = "ABC"
     Output: "BANC"
     Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
     Example 2:

     Input: s = "a", t = "a"
     Output: "a"
     Explanation: The entire string s is the minimum window.
     Example 3:

     Input: s = "a", t = "aa"
     Output: ""
     Explanation: Both 'a's from t must be included in the window.
     Since the largest window of s only has one 'a', return empty string.
 
    Solution.
        - use a sliding window keeping track of a valid window that has all chars in t.
            - use a hashmap containing all elements of s with default values of 0 and using each element of t and adding it the count of      the hashmap of s
            - this creates a character:count with only values we are looking for having a count greater than 0
            - we then keep track of a counter for how many chracters are in t
        
        - we begin with a start and end pointer at the first index and loop while end pointer < s.count
            - check if the element at our end pointer is part of the hashmap and subtract 1 from our counter if the element in our            hashmaps tally is greater than 0
            - we subtract 1 from the hashmaps tally for which end pointer is currently at
 
            - an inner while loop checks when our counter == 0 meaning that our end pointer has gone through enough characters in "s"         that we have all the matching characters req in "t"
 
                - from here we are looking if the length between start and end is our min window that meets the requirement of containing       all the characters from "t"
                    - we keep track of minLength which is only updated when "end - start + 1" is less than our minLength
                        - if we find a smaller length substring from one we already have we update the minLength and keep track of the             "start" pointer that is being moved
                
                - now we can move our start pointer which on the first run of our loop is at the beginning (index 0).
                    - Before moving the start pointer we have to check if by moving it (thus removing an element from the window) that if        its one of the characters we need to meet the "t" requirement that we update our counter
                       - if the character is part of our hashmap we add back to its tally by 1 if its current count >= 0
                    - move our start pointer by 1
                    - if we added back to our counter that will break the inner while loop and the outer while loop will continue forward        moving the end pointer to the right until again our counter becomes 0.
    
            - Once the loop has completed we return a string that begins at the minStart up to the minLength
              [minStart..<minStart + minLength]
                - in the case where no substring was found an empty string is returned. This case happens when the counter that kept            track of the amount of characters needed from "t" was not equal to 0 meaning we could not find a substring that met          that condition.
 
    Time: O(n)
    Space: O(n)
        
 */


func minWindow(_ s: String, _ t:String) -> String{
    var needMap = [Character:Int]()
            for char in s {
                needMap[char] = 0
            }
            for char in t {
                if needMap[char] != nil {
                    needMap[char] = needMap[char]! + 1
                }
                else {
                     needMap[char] = 1
                }
            }
            
            var start = 0
            var end = 0
            var minLength = Int.max
            var minStart = 0
            var missing = t.count
            var s = Array(s)
            
            while(end < s.count) {
                let current = s[end]
                if(needMap[current]! > 0) {
                    missing -= 1
                }
                needMap[current] = needMap[current]! - 1
                
                while(missing == 0) {
                    if(minLength > end - start + 1) {
                        minLength =  end - start + 1
                        minStart = start
                    }
                    
                    let head = s[start]
                    if(needMap[head]! >= 0) {
                        missing += 1
                    }
                    needMap[head] = needMap[head]! + 1
                    start += 1
                }
                end += 1
            }
            
            return minLength == Int.max ? "" : String(s[minStart..<minStart + minLength])
}

class TestCase: XCTestCase{
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(minWindow("ADOBECODBEBANC", "ABC"), "BANC")
        XCTAssertEqual(minWindow("a", "a"), "a")
        XCTAssertEqual(minWindow("a", "aa"), "")
    }
}


TestCase.defaultTestSuite.run()

