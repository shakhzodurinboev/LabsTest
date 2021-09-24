//
//  SearchHeaderTableViewCell.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import UIKit

final class SearchHeaderView: UIView {
    // MARK: - Outlets
    weak var boxView: UIView!
    weak var seperatorView: UIView!
    weak var topLocationButton:UIButton!
    weak var topTextField: UITextField!
    weak var bottomLocationButton:UIButton!
    weak var bottomTextField: UITextField!
    weak var dashedView: UIView!
    weak var topIconImage:UIImageView!
    weak var bottomIconImage: UIImageView!
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        clipsToBounds = true
        self.backgroundColor = Colors.grey
        self.setupBoxView()
        self.setupFromViewItems()
        self.setupSeperatorView()
        self.setupBottomViewItems()
        self.setupDashedView()
    }
    
    private func setupBoxView() {
        let view = UIView()
        view.backgroundColor = .clear
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(-16)
            make.top.equalTo(16)
            make.height.equalTo(112)
        }
        self.boxView = view
    }
    
    private func setupFromViewItems() {
        let topImage = UIImageView(image: UIImage(named: "ic_location"))
        topImage.contentMode = .scaleAspectFit
        self.boxView.addSubview(topImage)
        topImage.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.top.equalTo(8)
            make.width.equalTo(14)
            make.height.equalTo(18)
        }
        
        let fromLocationButton = UIButton()
        fromLocationButton.layer.cornerRadius = 17.5
        fromLocationButton.backgroundColor = Colors.primary
        fromLocationButton.setImage(UIImage(named: "ic_gps"), for: .normal)
        self.boxView.addSubview(fromLocationButton)
        fromLocationButton.snp.makeConstraints { make in
            make.width.height.equalTo(35)
            make.top.right.equalTo(0)
        }
        let textField = TextField(placeholderText: "Whence", placeholderColor: Colors.black, textColor: Colors.black, textFont: Fonts.montserrat_bold.withSize(15), borderStyle: UITextField.BorderStyle.none, keyboardType: .default)
        textField.autocorrectionType = .no
        self.boxView.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(topImage.snp.right).offset(16)
            make.right.equalTo(fromLocationButton.snp.left).offset(-16)
        }
        self.topIconImage = topImage
        self.topLocationButton = fromLocationButton
        self.topTextField = textField
    }
    
    private func setupSeperatorView() {
        let view = UIView()
        view.backgroundColor = Colors.seperatorColor.withAlphaComponent(0.15)
        self.boxView.addSubview(view)
        view.snp.makeConstraints { make in
            make.right.equalTo(0)
            make.top.equalTo(self.topLocationButton.snp.bottom).offset(18)
            make.left.equalTo(30)
            make.height.equalTo(1)
        }
        self.seperatorView = view
    }
    
    private func setupBottomViewItems() {
        let toLocationButton = UIButton()
        toLocationButton.layer.cornerRadius = 17.5
        toLocationButton.backgroundColor = Colors.primary
        toLocationButton.setImage(UIImage(named: "ic_gps"), for: .normal)
        self.boxView.addSubview(toLocationButton)
        toLocationButton.snp.makeConstraints { make in
            make.width.height.equalTo(35)
            make.right.equalTo(0)
            make.top.equalTo(self.seperatorView.snp.bottom).offset(22)
        }
        
        let bottomImage = UIImageView(image: UIImage(named: "ic_location"))
        bottomImage.contentMode = .scaleAspectFit
        self.boxView.addSubview(bottomImage)
        bottomImage.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.top.equalTo(self.seperatorView.snp.bottom).offset(32)
            make.width.equalTo(14)
            make.height.equalTo(18)
        }
        let textField = TextField(placeholderText: "Whence", placeholderColor: Colors.black, textColor: Colors.black, textFont: Fonts.montserrat_bold.withSize(15), borderStyle: UITextField.BorderStyle.none, keyboardType: .default)
        textField.autocorrectionType = .no
        self.boxView.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(toLocationButton.snp.top)
            make.left.equalTo(bottomImage.snp.right).offset(16)
            make.right.equalTo(toLocationButton.snp.left).offset(-16)
        }
        self.bottomLocationButton = toLocationButton
        self.bottomIconImage = bottomImage
    }
    
    private func setupDashedView() {
        let view = UIView()
        view.backgroundColor = .clear
        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.bottomIconImage.snp.top).offset(-6)
            make.top.equalTo(self.topIconImage.snp.bottom).offset(6)
            make.width.equalTo(1.5)
            make.centerX.equalTo(self.topIconImage.snp.centerX)
        }
        self.dashedView = view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.dashedView.layoutIfNeeded()
        
        self.dashedView.layer.sublayers?.removeAll()
        let lineLayer = CAShapeLayer()
        lineLayer.strokeColor = Colors.seperatorColor.withAlphaComponent(0.3).cgColor
        lineLayer.lineWidth = 1.5
        lineLayer.lineDashPattern = [5,3]
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: 0, y: dashedView.frame.height)])
        lineLayer.path = path
        self.dashedView.layer.addSublayer(lineLayer)
    }
    
}
