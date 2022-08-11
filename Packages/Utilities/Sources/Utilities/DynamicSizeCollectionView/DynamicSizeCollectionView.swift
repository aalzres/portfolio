//
//  DynamicSizeCollectionView.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/8/22.
//

import UIKit

public class DynamicSizeCollectionView: UICollectionView {
    override public var intrinsicContentSize: CGSize { contentSize }

    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }
}
