//
//  LongestCommonSubsequence.swift
//  
//
//  Created by Christopher Poole on 11/10/20.
//

import Foundation

struct LCSProblems {
  
  // MARK: Recursive / Top Down
  
  static func lcsMaxLength(_ p: String, _ q: String) -> Int {
    var memoized: [String: Int] = [:]
    return LCSProblems.lcsMaxLengthHelper(Array(p), Array(q), 0, 0, &memoized)
  }
  
  static private func lcsMaxLengthHelper(_ p: [Character], _ q: [Character], _ pIndex: Int, _ qIndex: Int, _ memoized: inout [String: Int]) -> Int {
    let key = "\(pIndex)-\(qIndex)"
    
    // Return the pre-memoized value if it exists
    if let memoizedValue = memoized[key] {
      return memoizedValue
    }
    
    // If you've exhausted all characters in *either* word, return 0
    if pIndex == p.count || qIndex == q.count {
      memoized[key] = 0
      return memoized[key]!
    }
    
    // If characters are the same, increment by 1 and continue recursion by advancing one character in each string
    if p[pIndex] == q[qIndex] {
      memoized[key] = 1 + lcsMaxLengthHelper(p, q, pIndex + 1, qIndex + 1, &memoized)
      return memoized[key]!
    }
    
    // If characters are different, explore two possibilities:
    // 1. Taking the same character in P and the next in Q OR
    // 2. Taking the same character in Q and the next in P
    // And determine which value is greater
    
    memoized[key] = max(
      lcsMaxLengthHelper(p, q, pIndex, qIndex + 1, &memoized),
      lcsMaxLengthHelper(p, q, pIndex + 1, qIndex, &memoized)
    )
    
    return memoized[key]!
  }
  
  // MARK: Dynamic Programming / Bottom Up
  
  
  static func lcsMaxLengthDP(_ p: String, _ q: String) -> Int {
    let p: [Character] = Array(p)
    let q: [Character] = Array(q)
    let rows = p.count + 1
    let cols = q.count + 1
    var choices: [[Int]] = Helpers.matrix(rows: rows, cols: cols, fillWith: 0)
    var lastChoice: Int { choices[rows - 1][cols - 1] }
    
    for i in 1..<rows {
      for j in 1..<cols {
        if p[i - 1] == q[j - 1] {
          choices[i][j] = 1 + choices[i - 1][j - 1]
        } else {
          choices[i][j] = max(choices[i - 1][j], choices[i][j - 1])
        }
      }
    }
    
    return lastChoice
  }
  
}
