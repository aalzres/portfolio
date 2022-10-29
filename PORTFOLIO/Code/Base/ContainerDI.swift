//
//  ContainerDI.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//  Copyright © 2022 aalzres. All rights reserved.
//

protocol ContainerDI {
    var domainContainerDI: DomainContainerDI { get }
}

final class ContainerDIImpl: ContainerDI {
    lazy var domainContainerDI: DomainContainerDI = DomainContainerDIImpl()
}
