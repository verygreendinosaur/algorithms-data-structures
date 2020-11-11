//
//  Knapsack.swift
//  
//
//  Created by Christopher Poole on 11/9/20.
//

import Foundation

struct KnapsackProblems {
  
  // MARK: Recursive / Top Down
  
  static func knapsack(_ items: [[Int]], _ capacity: Int) -> (Int, [Int]) {
    let currentValue: Int = 0
    var currentItems: [Int] = []
    var resultValue: Int = 0
    var resultItems: [Int] = []
    
    KnapsackProblems.knapsackHelper(items, capacity, start: 0, currentWeight: 0, currentValue: currentValue, currentItems: &currentItems, resultValue: &resultValue, resultItems: &resultItems)
    
    return (resultValue, resultItems)
  }
  
  private static func knapsackHelper(_ items: [[Int]], _ capacity: Int, start: Int, currentWeight: Int, currentValue: Int, currentItems: inout [Int], resultValue: inout Int, resultItems: inout [Int]) {
    
    // If current weight is too much, stop
    if currentWeight > capacity {
      return
    }
    
    // If the current value is greater than result value, reassign result value and result items
    if currentValue > resultValue {
      resultValue = currentValue
      resultItems = currentItems
    }
    
    for i in start..<items.count {
      let item = items[i]
      let itemValue = item[0]
      let itemWeight = item[1]
      currentItems.append(i)
      knapsackHelper(items, capacity, start: i + 1, currentWeight: (currentWeight + itemWeight), currentValue: currentValue + itemValue, currentItems: &currentItems, resultValue: &resultValue, resultItems: &resultItems)
      currentItems.removeLast()
    }
  }
  
  // MARK: Dynamic Programming / Bottom Up
  
  /// Given items, weights in the form of [[item val, weight]] and a max capacity, return the max value you can take.
  /// 1. You may only take each value once.
  /// 2. Use a dynamic programming approach.
  static func knapsackMaxValueDP(_ items: [[Int]], _ capacity: Int) -> Int {
    // Form a matrix of choices. Our columns represent max weights up to and including capacity. Our rows represent the indices of our items.
    let rows = items.count + 1
    let cols = capacity + 1
    var choices: [[Int]] = Helpers.matrix(rows: rows, cols: cols, fillWith: 0)
    var lastChoice: Int { choices[rows - 1][cols - 1] }
    
    for i in 1..<choices.count {
      for j in 1..<choices[i].count {
        
        let item = items[i - 1]
        let itemVal = item[0]
        let itemWeight = item[1]
        let currentCapacity = j
        
        if itemWeight > currentCapacity {
          choices[i][j] = choices[i - 1][j]
        } else {
          choices[i][j] = max(
            itemVal + choices[i - 1][j - itemWeight],
            choices[i - 1][j]
          )
        }
        
      }
    }
    
    return lastChoice
  }
  
}
