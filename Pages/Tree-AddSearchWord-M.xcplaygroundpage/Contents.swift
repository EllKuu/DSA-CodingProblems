import XCTest
import Foundation

/*
    Leetcode 211: Design Add and Search Words Data Structure
 
    Design a data structure that supports adding new words and finding if a string matches any previously added string.

    Implement the WordDictionary class:

     WordDictionary() Initializes the object.
     void addWord(word) Adds word to the data structure, it can be matched later.
     bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
 
 Input
 ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
 [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
 Output
 [null,null,null,null,false,true,true,true]

 Explanation
 WordDictionary wordDictionary = new WordDictionary();
 wordDictionary.addWord("bad");
 wordDictionary.addWord("dad");
 wordDictionary.addWord("mad");
 wordDictionary.search("pad"); // return False
 wordDictionary.search("bad"); // return True
 wordDictionary.search(".ad"); // return True
 wordDictionary.search("b.."); // return True


 
 */

public class TrieNode {
    var children = [Character : TrieNode]()
    var isWord = false
    
}

class WordDictionary {

    private var root = TrieNode()
    init() {
        
    }
    
    // Time: O(n), Space: O(n)
    func addWord(_ word: String) {
        
        var node = root
        for c in word{
            if node.children[c] == nil { node.children[c] = TrieNode() }
            node = node.children[c]!
        }
        node.isWord = true
    }
    
    
    // Time: O(wl) w is number of words and l is avg length
    // Space: O(mn) m is avg length of word and n is number of words
    func search(_ word: String) -> Bool {
           return dfs(0, Array(word), root)
       }
       
       func dfs(_ index: Int, _ word: [Character], _ node: TrieNode) -> Bool {
           if index == word.count { return node.isWord }
           let char = word[index]
           if char != "." {
               return node.children[char] != nil && dfs(index + 1, word, node.children[char]!)
           } else {
               for ch in node.children.keys {
                   if node.children[ch] != nil && dfs(index + 1, word, node.children[ch]!) {
                       return true
                   }
               }
           }
           
           return false
       }
}
