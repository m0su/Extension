//
//  File.swift
//  
//
//  Created by seo on 2021/09/24.
//

import CoreGraphics

public extension IntegerLiteralType {
  var f: CGFloat {
    return CGFloat(self)
  }
  
  var timeInterval_s: DispatchTimeInterval { return .seconds(self) }
  var timeInterval_ms: DispatchTimeInterval { return .milliseconds(self) }
}

public extension FloatLiteralType {
  var f: CGFloat {
    return CGFloat(self)
  }
}

