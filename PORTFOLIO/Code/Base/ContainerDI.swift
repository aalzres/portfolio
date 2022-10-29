//
//  ContainerDI.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//  Copyright © 2022 aalzres. All rights reserved.
//

import CustomMap

protocol ContainerDI: CustomMapContainerDI {}

final class ContainerDIImpl: ContainerDI {
    private init() {}
    static let shared = ContainerDIImpl()

    private lazy var domainContainerDI = DomainContainerDIImpl.shared
    var customMapDomainContainerDI: CustomMapDomainContainerDI { domainContainerDI }
}
