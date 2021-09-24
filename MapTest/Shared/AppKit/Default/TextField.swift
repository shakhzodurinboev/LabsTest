//
//  TextField.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import Foundation
import UIKit

class TextField: UITextField {
    
    internal var maxCharacters:Int?
    
    init(placeholderText: String? = nil, placeholderColor: UIColor? = nil, textColor: UIColor? = nil, textFont: UIFont? = nil, borderStyle: UITextField.BorderStyle? = nil, keyboardType: UIKeyboardType? = nil) {
        super.init(frame: .zero)
        self.attributedPlaceholder = NSAttributedString(string: placeholderText ?? "", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor ?? .lightGray])
        self.textColor = textColor
        self.font = textFont
        self.borderStyle = borderStyle ?? .none
        self.keyboardType = keyboardType ?? .default
        
        self.addTarget(self, action: #selector(limitLength(textField:)), for: .editingChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) || action == #selector(paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    @objc func limitLength(textField:TextField) {
        if self.text!.count > maxCharacters ?? 20 {
            textField.deleteBackward()
        }
    }
}
