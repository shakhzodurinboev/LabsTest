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
    func searchViewTapped()
}

final class LocationRootView: UIView {
    // MARK: - Outlets
    weak var mapView:GMSMapView!
    weak var pinIcon:UIImageView!
    weak var primaryButton:PrimaryButton!
    weak var searchView: UIView!
    weak var searchLabel: Label!
    
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
        self.setupSearchView()
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
    
    private func setupSearchView() {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchViewTapped)))
        view.backgroundColor = Colors.background
        view.layer.cornerRadius = 24
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.top.equalTo(50)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(52)
        }
        self.searchView = view
        
        let searchIcon = UIImageView(image: UIImage(named: "ic_search"))
        searchIcon.contentMode = .scaleAspectFit
        self.searchView.addSubview(searchIcon)
        searchIcon.snp.makeConstraints { make in
            make.width.height.equalTo(21)
            make.left.equalTo(16)
            make.centerY.equalTo(self.searchView.snp.centerY)
        }
        
        let seperator = UIView()
        seperator.backgroundColor = Colors.lineSeperator
        self.searchView.addSubview(seperator)
        seperator.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(24)
            make.left.equalTo(searchIcon.snp.right).offset(16)
            make.centerY.equalTo(self.searchView.snp.centerY)
        }
        
        let searchLabel = Label(font: Fonts.montserrat_medium.withSize(15), lines: 1, color: Colors.searchText, text: "Search")
        self.searchView.addSubview(searchLabel)
        searchLabel.snp.makeConstraints { make in
            make.left.equalTo(seperator.snp.right).offset(16)
            make.centerY.equalTo(self.searchView.snp.centerY)
            make.right.equalTo(-16)
            make.height.equalTo(18)
        }
        self.searchLabel = searchLabel
    }
    
    // MARK: - Actions
    @objc func primaryButtonAction(_ sender: UIButton) {
        self.ixResponder?.primaryButtonAction()
    }
    
    @objc func searchViewTapped() {
        self.ixResponder?.searchViewTapped()
    }
    
}
