//
//  CustomMapDomainContainerDI.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 29/10/22.
//

public protocol CustomMapDomainContainerDI {
    var locationUseCase: LocationUseCase { get }
    var mapUseCase: MapUseCase { get }
}
