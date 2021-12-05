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
        characterValues.spacing = PDimen.paddingS
        characterValues.axis = .vertical
        return characterValues
    }()
    lazy var characterName: UILabel = {
        let characterName = UILabel()
        characterName.font = PFont.primary
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
        contentView.backgroundColor = PColor.white
        
        characterValues.anchor(contentView,
                               top: contentView.topAnchor, paddingTop: PDimen.paddingS,
                               bottom: contentView.bottomAnchor, paddingBottom: -PDimen.paddingS,
                               leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                               trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        characterValues.addArrangedSubview(characterName)
    }
}
