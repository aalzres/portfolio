//
//  MarvelTableCell.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 13/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

class MarvelTableCell: UITableViewCell {
    private lazy var textStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = PDimen.paddingS
        stack.axis = .vertical
        return stack
    }()
    
    lazy var name: UILabel = {
        let name = UILabel()
        name.font = PFont.primary
        return name
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellView() {
        textStack.anchor(contentView,
                         top: contentView.topAnchor, paddingTop: PDimen.paddingS,
                         leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                         trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        textStack.addArrangedSubview(name)
    }
}
