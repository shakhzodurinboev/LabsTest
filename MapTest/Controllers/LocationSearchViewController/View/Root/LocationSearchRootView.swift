//
//  LocationSearchRootView.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import Foundation
import UIKit

final class LocationSearchRootView: UIView {
    // MARK: - Outlets
    weak var tableView:UITableView!
    
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
        backgroundColor = Colors.background
        self.setupTableView()
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = Colors.background
        self.addSubview(tableView)
        tableView.snp.makeConstraints({$0.edges.equalTo(self.snp.edges)})
        self.tableView = tableView
    }
    
}
