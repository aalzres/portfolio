//
//  MarkerInfo+MapElement.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

extension MarkerInfo {
    init(entity: MapElement) {
        self.init(
            indicator: entity.indicator,
            position: CustomMapCoordinates(entity.coordinates)
        )
    }
}
