//
//  KnapsackTests.swift
//  AlgorithmsDataStructuresTests
//
//  Created by Christopher Poole on 11/9/20.
//

import XCTest
@testable import AlgorithmsDataStructures

final class KnapsackTests: XCTestCase {
  
  func testKnapsack() {
    var items = [[1, 2], [4, 3], [5, 6], [6, 7]]
    var capacity = 10
    var expected = (10, [1, 3])
    
    XCTAssertEqual(KnapsackProblems.knapsack(items, capacity).0, expected.0)
    XCTAssertEqual(KnapsackProblems.knapsack(items, capacity).1, expected.1)
    
    items = [[1, 2], [4, 3], [5, 6], [6, 7]]
    capacity = 5
    expected = (5, [0, 1])
    
    XCTAssertEqual(KnapsackProblems.knapsack(items, capacity).0, expected.0)
    XCTAssertEqual(KnapsackProblems.knapsack(items, capacity).1, expected.1)
  }
  
  func testKnapsackMaxValueDP() {
    var items = [[1, 2], [4, 3], [5, 6], [6, 7]]
    var capacity = 10
    
    XCTAssertEqual(KnapsackProblems.knapsackMaxValueDP(items, capacity), 10)
    
    items = [[1, 2], [4, 3], [5, 6], [6, 7]]
    capacity = 5
    
    XCTAssertEqual(KnapsackProblems.knapsackMaxValueDP(items, capacity), 5)
  }
  
}
