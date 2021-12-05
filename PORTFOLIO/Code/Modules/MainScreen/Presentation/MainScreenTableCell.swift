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
        menuItems.spacing = .paddingS
        menuItems.axis = .vertical
        return menuItems
    }()
    lazy var nameItem: UILabel = {
        let nameItem = UILabel()
        nameItem.font = .primary
        nameItem.textColor = .black
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
        contentView.backgroundColor = .white
        
        menuItems.anchor(contentView,
                         top: contentView.topAnchor, paddingTop: .paddingS,
                         bottom: contentView.bottomAnchor, paddingBottom: -.paddingS,
                         leading: contentView.leadingAnchor, paddingLeading: .paddingS)
        menuItems.addArrangedSubview(nameItem)
    }
    
    private func setupArrow() {
        arrow.anchor(contentView,
                     leading: menuItems.trailingAnchor, paddingLeading: .paddingS,
                     trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS,
                     centerY: menuItems.centerYAnchor)
    }
}
