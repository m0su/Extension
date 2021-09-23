//
//  File.swift
//  
//
//  Created by seo on 2021/09/23.
//

import UIKit

import Then

extension UIButton {
  func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
    UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
    guard let context = UIGraphicsGetCurrentContext() else { return }
    context.setFillColor(color.cgColor)
    context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
    
    let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    self.setBackgroundImage(backgroundImage, for: state)
  }
  
  func animate() {
    _ = CABasicAnimation(keyPath: "backgroundColor").then {
      $0.fromValue = backgroundColor
      $0.toValue = UIColor.white
      $0.duration = TimeInterval(0.2)
      $0.autoreverses = true
      self.layer.add($0, forKey: "ColorPulse")
    }
  }
  
  override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    isHighlighted = true
    animate()
    super.touchesBegan(touches, with: event)
  }
  
  override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    isHighlighted = false
    super.touchesEnded(touches, with: event)
  }
  
  override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    isHighlighted = false
    super.touchesCancelled(touches, with: event)
  }
  
}
