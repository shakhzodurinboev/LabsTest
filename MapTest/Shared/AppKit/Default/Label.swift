//
//  Label.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import UIKit

final class Label: UILabel {
    
    init(font: UIFont?, lines: Int, color: UIColor?,text:String = "") {
        super.init(frame: .zero)
        self.font = font
        self.numberOfLines = lines
        self.textColor = color
        self.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
