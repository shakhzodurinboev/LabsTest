//
//  LocationRootView.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import UIKit
import GoogleMaps

protocol LocationViewIxResponder:class {
    func primaryButtonAction()
}

final class LocationRootView: UIView {
    // MARK: - Outlets
    weak var mapView:GMSMapView!
    weak var pinIcon:UIImageView!
    weak var primaryButton:PrimaryButton!
    // MARK: - Delegates
    weak var ixResponder:LocationViewIxResponder?
    
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
        self.backgroundColor = Colors.background
        self.setupMapView()
        self.setupPinIcon()
        self.setupPrimaryButton()
    }
    
    private func setupMapView() {
        let mapView = GMSMapView()
        self.addSubview(mapView)
        mapView.snp.makeConstraints({$0.edges.equalToSuperview()})
        self.mapView = mapView
    }
    
    private func setupPinIcon() {
        let pinIcon: UIImageView = UIImageView(image: UIImage(named: "ic_pin"))
        self.addSubview(pinIcon)
        pinIcon.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            let height = UIScreen.main.bounds.height / 2
            make.bottom.equalTo(-height)
        }
        self.pinIcon = pinIcon
    }
    
    private func setupPrimaryButton() {
        let button = PrimaryButton()
        button.addTarget(self, action: #selector(primaryButtonAction(_:)), for: .touchUpInside)
        button.set(title: "Where we go?")
        self.addSubview(button)
        button.snp.makeConstraints { make in
            make.left.equalTo(24)
            make.height.equalTo(55)
            make.right.equalTo(-90)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-4)
        }
        self.primaryButton = button
    }
    // MARK: - Actions
    @objc func primaryButtonAction(_ sender: UIButton) {
        self.ixResponder?.primaryButtonAction()
    }
}
