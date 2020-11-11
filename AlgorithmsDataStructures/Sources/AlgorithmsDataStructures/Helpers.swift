//
//  Helpers.swift
//  
//
//  Created by Christopher Poole on 11/10/20.
//

import Foundation

struct Helpers {
  
  static func matrix<T>(rows: Int, cols: Int, fillWith value: T) -> [[T]] {
    Array(repeating: Array(repeating: value, count: cols), count: rows)
  }
  
}
