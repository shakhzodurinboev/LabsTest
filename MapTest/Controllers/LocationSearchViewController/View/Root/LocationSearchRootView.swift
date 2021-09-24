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
    weak var searchHeaderView: SearchHeaderView!
    
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
        self.setupHeaderView()
        self.setupTableView()
    }
    
    private func setupHeaderView() {
        let view = SearchHeaderView()
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.top.left.right.equalTo(0)
        }
        self.searchHeaderView = view
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = Colors.background
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(self.searchHeaderView.snp.bottom).offset(0)
        }
        self.tableView = tableView
    }
    
}
