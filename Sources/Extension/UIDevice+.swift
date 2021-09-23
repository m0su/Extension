//
//  File.swift
//  
//
//  Created by seo on 2021/09/23.
//

import UIKit

public extension UIDevice {
  fileprivate static let _currentDevice = UIDevice.current
  
  
  // Version
  public class var majorVersion: Int { return Int(_currentDevice.systemVersion.components(separatedBy: ".").first!)! }
  
  // Name
  public class var uuid: String { return _currentDevice.identifierForVendor?.uuidString ?? "Not Found UUID" }
  
  public var modelName: String {
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
      guard let value = element.value as? Int8, value != 0 else { return identifier }
      return identifier + String(UnicodeScalar(UInt8(value)))
    }
    
    switch identifier {
    case "iPod9,1":                                 return "iPod Touch 7"
      
    case "iPhone8,1":                               return "iPhone 6s"
    case "iPhone8,2":                               return "iPhone 6s Plus"
    case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
    case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
    case "iPhone8,4":                               return "iPhone SE"
    case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
    case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
    case "iPhone10,3", "iPhone10,6":                return "iPhone X"
    case "iPhone11,8":                              return "iPhone XR"
    case "iPhone11,2":                              return "iPhone Xs"
    case "iPhone11,6", "iPhone11,4":                return "iPhone Xs Max"
    case "iPhone12,1":                              return "iPhone 11"
    case "iPhone12,3":                              return "iPhone 11 Pro"
    case "iPhone12,5":                              return "iPhone 11 Pro Max"
    case "iPhone12,8":                              return "iPhone SE 2"
    case "iPhone13,1":                              return "iPhone 12 Mini"
    case "iPhone13,2":                              return "iPhone 12"
    case "iPhone13,3":                              return "iPhone 12 Pro"
    case "iPhone13,4":                              return "iPhone 12 Pro Max"
    case "iPhone14,2":                              return "iPhone 13 Pro"
    case "iPhone14,3":                              return "iPhone 13 Pro Max"
    case "iPhone14,4":                              return "iPhone 13 Mini"
    case "iPhone14,5":                              return "iPhone 13"
      
    case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
    case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
    
    case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7"
    case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9"
      
    case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 2nd"
    case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5"
    case "iPad7,5", "iPad7,6":                      return "iPad 6"
      
    case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro 11"
    case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro 12.9 3rd"
    case "iPad8,9", "iPad8,1":                      return "iPad Pro 11 2nd"
    case "iPad8,11", "iPad8,12":                    return "iPad Pro 12.9 4th"
      
    case "iPad11,1", "iPad11,2":                    return "iPad Mini 5"
    case "iPad11,3", "iPad11,4":                    return "iPad Air 3"
    
    case "iPad13,1", "iPad13,2":                    return "iPad Air 4"
    case "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7":return "iPad Pro 11 3rd"
    case "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,7":return "iPad Pro 12.9 5th"
      
      
    case "i386", "x86_64":                          return "Simulator"
    default:                                        return identifier
    }
  }
}
