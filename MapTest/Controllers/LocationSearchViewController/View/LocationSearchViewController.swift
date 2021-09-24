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
    }
    
}

extension LocationSearchViewController {
    private func appearanceSettings() {
        self.title = "Specify the place of dispatch"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.dataProvider.tableView = self.view().tableView
    }
}
