//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/12/21.
//

import UIKit

public class CButton: BaseUIView {
    lazy var customButtom = UIButton()
        .set(\.backgroundColor, .first)
        .set(\.cornerRadius, .buttonCornerRadius)
        .set(\.titleColorForNormal, .second)

    public override func addAllSubviews() {
        super.addAllSubviews()
        addSubview(customButtom)
    }
    public override func addAllConstraints() {
        super.addAllConstraints()
        customButtom.snp.makeConstraints {
            $0.height.equalTo(.buttonHeight)
            $0.edges.equalToSuperview().inset(.paddingS)
        }
    }
}

extension CButton {
    public var text: String? {
        set { customButtom.titleForNormal = newValue }
        get { customButtom.titleForNormal }
    }
}
