import XCTest
import Foundation

/*
    Leetcode 208: Implement a Trie - Medium
 
 A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

 Implement the Trie class:

 Trie() Initializes the trie object.
 void insert(String word) Inserts the string word into the trie.
 boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
 boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
  

 Example 1:

 Input
 ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
 [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
 Output
 [null, null, true, false, true, null, true]

 Explanation
 Trie trie = new Trie();
 trie.insert("apple");
 trie.search("apple");   // return True
 trie.search("app");     // return False
 trie.startsWith("app"); // return True
 trie.insert("app");
 trie.search("app");     // return True
 
 */
public class TrieNode {
    var children = [Character:TrieNode]()
    var isWord = false
    
    func add(_ value: Character) -> TrieNode{
        let node = TrieNode()
        children[value] = node
        return node
    }
}

class Trie {

    private var root = TrieNode()
    
    init() {
        
    }
    
    func insert(_ word: String) {
        guard !word.isEmpty else { return }
        
        var curNode = root
        for c in word.lowercased(){
            if let childNode = curNode.children[c]{
                curNode  = childNode
            }else{
                let node = curNode.add(c)
                curNode = node
            }
        }
        curNode.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        
        var curNode = root
        for c in word.lowercased(){
            guard let cNode = curNode.children[c] else { return false }
            curNode = cNode
        }
        return curNode.isWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        guard !prefix.isEmpty else { return false }
        
        var curNode = root
        for c in prefix.lowercased(){
            guard let cNode = curNode.children[c] else { return false }
            curNode = cNode
        }
        return true
    }
}
