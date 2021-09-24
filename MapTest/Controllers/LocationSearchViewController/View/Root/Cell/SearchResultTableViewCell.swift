//
//  SearchResultTableViewCell.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    // MARK: - Outlets
    weak var rightIcon: UIImageView!
    weak var centerLabel:Label!
    weak var descLabel: Label!
    weak var leftIcon: UIImageView!
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        clipsToBounds = true
        self.selectionStyle = .none
        self.setupLeftIcon()
        self.setupRighIcon()
        self.setupCenterLabel()
        self.setupSeperatorLine()
    }
    
    private func setupLeftIcon() {
        let icon = UIImageView(image: UIImage(named: "ic_favorite"))
        self.contentView.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.bottom.equalTo(-16)
            make.width.height.equalTo(18)
            make.left.equalTo(24)
        }
        self.leftIcon = icon
    }
    private func setupRighIcon() {
        let icon = UIImageView(image: UIImage(named: "ic_chevron_right"))
        self.contentView.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.right.equalTo(-20)
            make.width.equalTo(10)
            make.height.equalTo(14)
        }
        self.rightIcon = icon
    }
    
    private func setupCenterLabel() {
        let label = Label(font: Fonts.montserrat_bold.withSize(13), lines: 1, color: Colors.black, text: "Favotite address")
        let desLabel = Label(font: Fonts.montserrat_regular.withSize(10), lines: 1, color: Colors.textColorGrey, text: "13 km • 13 Rue Notre Dame, Luxembourg")
        desLabel.isHidden = true
        let stack = StackView(axis: .vertical, alignment: .fill, distribution: .fill, spacing: 0, views: [label,desLabel])
        self.contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.left.equalTo(self.leftIcon.snp.right).offset(24)
            make.right.equalTo(self.rightIcon.snp.left).offset(-24)
            make.centerY.equalTo(self.contentView.snp.centerY)
        }
        self.centerLabel = label
        self.descLabel = desLabel
    }
    
    private func setupSeperatorLine() {
        let view = UIView()
        view.backgroundColor = Colors.seperatorColor.withAlphaComponent(0.08)
        self.contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(1)
        }
    }
    
    func configure() {
        self.leftIcon.image = UIImage(named: "ic_search")
        self.descLabel.isHidden = false
    }
}
