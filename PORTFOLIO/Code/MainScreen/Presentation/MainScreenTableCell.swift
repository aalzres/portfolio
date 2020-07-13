//
//  MainScreenTableCell.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 13/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

class MainScreenTableCell: UITableViewCell {
    lazy var menuItems: UIStackView = {
        let menuItems = UIStackView()
        menuItems.spacing = PDimen.paddingS
        menuItems.axis = .vertical
        return menuItems
    }()
    lazy var nameItem: UILabel = {
        let nameItem = UILabel()
        nameItem.font = PFont.primary
        return nameItem
    }()
    private lazy var arrow: UIImageView = UIImageView(image: UIImage(named: "arrow"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellView()
        setupArrow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellView() {
        menuItems.anchor(contentView,
                         top: contentView.topAnchor, paddingTop: PDimen.paddingS,
                         bottom: contentView.bottomAnchor, paddingBottom: -PDimen.paddingS,
                         leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS)
        menuItems.addArrangedSubview(nameItem)
    }
    
    private func setupArrow() {
        arrow.anchor(contentView,
                     leading: menuItems.trailingAnchor, paddingLeading: PDimen.paddingS,
                     trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS,
                     centerY: menuItems.centerYAnchor)
    }
}
