//
//  Shadow.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import Foundation
import UIKit

extension CALayer {
    func applySketchShadow(
        color: UIColor? = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        masksToBounds = false
        shadowColor = color?.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    func removeShadow() {
        shadowOffset = CGSize(width: 0 , height: 0)
        shadowColor = UIColor.clear.cgColor
        shadowRadius = 0.0
        shadowOpacity = 0.0
    }
    
}
