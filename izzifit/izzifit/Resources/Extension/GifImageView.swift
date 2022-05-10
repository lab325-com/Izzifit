//
//  GifImageView.swift
//  izzifit
//
//  Created by O l e h on 09.05.2022.
//

import UIKit
import Gifu

class MyImageView: UIImageView, GIFAnimatable {
  public lazy var animator: Animator? = {
    return Animator(withDelegate: self)
  }()

  override public func display(_ layer: CALayer) {
    updateImageIfNeeded()
  }
}
