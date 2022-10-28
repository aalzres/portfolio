//
//  MarvelTableCell.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 13/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

class MarvelTableCell: UITableViewCell {
    private lazy var characterValues: UIStackView = {
        let characterValues = UIStackView()
        characterValues.spacing = .paddingS
        characterValues.axis = .vertical
        return characterValues
    }()
    lazy var characterName: UILabel = {
        let characterName = UILabel()
        characterName.font = .primary
        return characterName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellView() {
        contentView.backgroundColor = .background
        
        characterValues.anchor(contentView,
                               top: contentView.topAnchor, paddingTop: .paddingS,
                               bottom: contentView.bottomAnchor, paddingBottom: -.paddingS,
                               leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                               trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
        characterValues.addArrangedSubview(characterName)
    }
}
