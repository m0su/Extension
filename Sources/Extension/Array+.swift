//
//  File.swift
//  
//
//  Created by seo on 2021/09/23.
//

import Foundation

extension Array where Element: Equatable {
  static func -(lhs: Array, rhs: Array) -> Array {
    return lhs.filter { !rhs.contains($0) }
  }
}

extension Array where Element: Hashable {
  public func orderedSet() -> [Element] {
    var seen = Set<Element>()
    return self.filter { seen.insert($0).inserted }
  }
}

public extension Array where Element == UInt8 {
  func toBase64() -> String {
    Data(self).base64EncodedString()
  }

  init(base64: String) {
    self.init()

    guard let decodedData = Data(base64Encoded: base64) else {
      return
    }

    append(contentsOf: decodedData.bytes)
  }

  func toBase64URL() -> String {
    // 62 +
    // 63 /
    // (pad) =
    var res = self.toBase64()
    
    res = res.replacingOccurrences(of: "/", with: "_")
      .replacingOccurrences(of: "+", with: "-")
    
    return res
  }
}

