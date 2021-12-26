//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/12/21.
//

import UIKit
import Architecture

open class BaseUIView: UIView {
    public init () {
        super.init(frame: .zero)
        setupView()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    open func setupView() {
        addAllSubviews()
        addAllConstraints()
        bind()
    }

    open func addAllSubviews() {}
    open func addAllConstraints() {}
    open func bind() {}

    deinit { BaseDeinit.shared.printDeinit(self) }
}
