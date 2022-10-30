//
//  MapElement.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 30/10/22.
//

public protocol MapElement {
    var coordinates: Coordinates { get }
    var name: String { get }
    var indicator: String { get }
}
