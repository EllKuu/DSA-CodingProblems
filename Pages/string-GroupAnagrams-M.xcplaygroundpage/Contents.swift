import XCTest
import Foundation

/*
 Leetcode 49: Group Anagrams - Medium
 
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.
 
 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 
 Example 1:
 
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 Example 2:
 
 Input: strs = [""]
 Output: [[""]]
 Example 3:
 
 Input: strs = ["a"]
 Output: [["a"]]
 
    Solution:
    - use a loop to go through each string and sort the string. Using the sorted string as a key for a dictionary we can append the string to that key.
    - for each string encountered in our loop if that sorted key exists in our dictionary the string will be added
    - return an array of the values of our dictionary
    
 
 */


func groupAnagrams(_ strs: [String]) -> [[String]]{
    var dict = [String:[String]]()
    for s in strs {
        dict[String(s.sorted()), default: []].append(s)
    }
    return Array(dict.values)
}

groupAnagrams(["eat","tea","tan","ate","nat","bat"])
groupAnagrams(["",""])
groupAnagrams(["a"])
