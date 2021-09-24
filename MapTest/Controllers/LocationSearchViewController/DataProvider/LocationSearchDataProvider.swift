//
//  LocationSearchDataProvider.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import Foundation
import UIKit

final class LocationSearchDataProvider:NSObject, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Outlets
    weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.showsVerticalScrollIndicator = false
            tableView.separatorStyle = .none
            tableView.register(SearchHeaderTableViewCell.self, forCellReuseIdentifier: SearchHeaderTableViewCell.className)
            tableView.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.className)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchHeaderTableViewCell.className) as? SearchHeaderTableViewCell else { return UITableViewCell() }
            return cell
        } else {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.className) as? SearchResultTableViewCell else { return UITableViewCell() }
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.className) as? SearchResultTableViewCell else { return UITableViewCell() }
                cell.configure()
                return cell
            }
        }
    }
    
}
