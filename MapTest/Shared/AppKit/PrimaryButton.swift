//
//  PrimaryButton.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import UIKit

final class PrimaryButton: BaseButton {
    
    override var isEnabled: Bool {
        didSet {
            isEnabled ? enable() : disable()
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        enable()
        self.setTitleColor(Colors.white, for: .highlighted)
        self.titleLabel?.font = Fonts.proxima_nov_bold.withSize(17)
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
    }
    
    func set(title string: String) {
        self.setTitle(string, for: .normal)
    }
    
    func enable() {
        self.backgroundColor = Colors.primary
        self.setTitleColor(Colors.white, for: .normal)
        self.setTitleColor(.white, for: .highlighted)
        self.layer.applySketchShadow(color: UIColor.short(red: 255, green: 211, blue: 95), alpha: 0.2, x: 0, y: 10, blur: 10, spread: 0)
    }
    
    func disable() {
        self.backgroundColor = Colors.primary.withAlphaComponent(0.5)
        self.setTitleColor(Colors.white, for: .normal)
        self.layer.shadowOpacity = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if isEnabled {
            self.layer.applySketchShadow(color: UIColor.short(red: 255, green: 211, blue: 95), alpha: 0.2, x: 0, y: 10, blur: 10, spread: 0)
        } else {
            self.layer.removeShadow()
        }
    }
}

class BaseButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            self.titleLabel?.alpha = 1
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
            self.titleLabel?.alpha = 1
        }
    }
}

