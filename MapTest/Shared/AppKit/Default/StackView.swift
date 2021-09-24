//
//  StackView.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import Foundation
import UIKit

class StackView: UIStackView {
    
    init(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat, views: [UIView]? = nil) {
        super.init(frame: .zero)
        
        views?.forEach{addArrangedSubview($0)}
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
