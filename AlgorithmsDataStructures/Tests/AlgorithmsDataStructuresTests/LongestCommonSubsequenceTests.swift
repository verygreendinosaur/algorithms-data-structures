//
//  LongestCommonSubsequenceTests.swift
//  AlgorithmsDataStructuresTests
//
//  Created by Christopher Poole on 11/10/20.
//

import XCTest
@testable import AlgorithmsDataStructures

final class LongestCommonSubsequenceTests: XCTestCase {
  
  func testLcsMaxLength() {
    let p = "bd"
    let q = "abcd"
    
    XCTAssertEqual(LCSProblems.lcsMaxLength(p, q), 2)
  }
  
  func testLcsMaxLengthDP() {
    let p = "bd"
    let q = "abcd"
    
    XCTAssertEqual(LCSProblems.lcsMaxLengthDP(p, q), 2)
  }
  
}
