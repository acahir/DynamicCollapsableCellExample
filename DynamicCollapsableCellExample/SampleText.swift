//
//  sampleText.swift
//
//  Created by Steve Cochran on 6/29/17.
//  Copyright © 2017 Example, Inc. All rights reserved.
//

import Foundation

class SampleText {
  
  private let base = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  
  func getText(ofLength length: Int) -> String {
    
    if let lengthIndex = base.index(base.startIndex, offsetBy: length, limitedBy: base.endIndex) {
      return base.substring(to: lengthIndex)
    } else {
      return base
    }
  }
}
