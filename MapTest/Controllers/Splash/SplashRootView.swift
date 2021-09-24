//
//  SplashRootView.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import UIKit

class SplashRootView: UIView {
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        self.backgroundColor = Colors.background
    }
    
}
