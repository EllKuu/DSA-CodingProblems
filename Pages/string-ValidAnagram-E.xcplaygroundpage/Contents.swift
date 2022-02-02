import XCTest
import Foundation

/*
 Leetcode 242: Valid Anagram - Easy
 
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.
 
 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 
 Example 1:
 
 Input: s = "anagram", t = "nagaram"
 Output: true
 Example 2:
 
 Input: s = "rat", t = "car"
 Output: false
 
 */

/*
 Solution 1: create two dictionaries to keep track of letters and the count
 - check if counts are the same
 - declare two dictionaries of [Character:Int]
 - loop through string 1 and map characters to the dictionary
 - loop through string 2 and map characters to the dictionary
 - compare the dictionaries and return
 Time: O(n)
 Space: O(n)
 */

func isAnagram1(s: String, t: String) -> Bool{
    guard s.count == t.count else { return false }
    var mapS = [Character: Int]()
    var mapT = [Character: Int]()
    
    for c in s{
        if let count = mapS[c]{
            mapS[c] = count + 1
        }else{
            mapS[c] = 1
        }
    }
    
    for c in t{
        if let count = mapT[c]{
            mapT[c] = count + 1
        }else{
            mapT[c] = 1
        }
    }
    
    return mapS == mapT
}

/*
 Solution 2: use the sort function and compare the two strings
 Time: O(nlogn)
 Space: O(1)
 
 */

func isAnagram2(s: String, t:String) -> Bool{
    return s.sorted() == t.sorted()
}

/*
 Solution 3: taking into account unicode characters
 */
func isAnagram3(s: String, t:String) -> Bool{
    guard s.count == t.count else { return false }
    var sCount = [UInt32: Int]()
    var tCount = [UInt32: Int]()
    
    for sChar in s.unicodeScalars {        
        if sCount[sChar.value] != nil {
            sCount[sChar.value]! += 1
        } else {
            sCount[sChar.value] = 1
        }
    }
    
    for tChar in t.unicodeScalars{
        if tCount[tChar.value] != nil {
            tCount[tChar.value]! += 1
        } else {
            tCount[tChar.value] = 1
        }
    }
    
    return sCount == tCount
}

// Testing

class TestCase: XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test1(){
        XCTAssertEqual(isAnagram1(s: "toy", t: "yot"), true)
        XCTAssertEqual(isAnagram1(s: "toyw", t: "yotg"), false)
    }
    
    func test2(){
        XCTAssertEqual(isAnagram2(s: "rat", t: "tar"), true)
        XCTAssertEqual(isAnagram2(s: "rato", t: "ltar"), false)
    }
    
    func test3(){
        XCTAssertEqual(isAnagram3(s: "roar😝", t: "orar😀"), false)
        XCTAssertEqual(isAnagram3(s: "roar😀", t: "orar😀"), true)
    }
}

TestCase.defaultTestSuite.run()
