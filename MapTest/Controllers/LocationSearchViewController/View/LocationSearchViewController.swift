//
//  LocationSearchViewController.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import UIKit

class LocationSearchViewController: UIViewController,ViewSpecificController {
    // MARK: - RootView
    typealias RootView = LocationSearchRootView
    // MARK: - Services
    private let dataProvider = LocationSearchDataProvider()
    
    override func loadView() {
        super.loadView()
        self.view = LocationSearchRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appearanceSettings()
        self.setupActions()
    }
    
}

extension LocationSearchViewController {
    
    private func appearanceSettings() {
        self.title = "Specify the place of dispatch"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.dataProvider.tableView = self.view().tableView
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    private func setupActions() {
        self.view().searchHeaderView.topLocationButton.addTarget(self, action: #selector(topLocationButtonAction(_:)), for: .touchUpInside)
        self.view().searchHeaderView.bottomLocationButton.addTarget(self, action: #selector(bottomLocationButtonAction(_:)), for: .touchUpInside)
        self.view().searchHeaderView.topTextField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func topLocationButtonAction(_ sender: UIButton) {
        print("HOLA TOP")
    }
    
    @objc func bottomLocationButtonAction(_ sender: UIButton) {
        print("HOLA BOTTOM")
    }
    
    @objc func editingChanged(_ sender: UITextField) {
        self.dataProvider.tableDataSource.sourceTextHasChanged(sender.text)
    }
    
}

