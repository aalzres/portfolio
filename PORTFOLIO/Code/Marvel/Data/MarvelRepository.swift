//
//  MarvelRepository.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MarvelRepositoryOutput: class {
    func getCharactersSuccess(responseData: CharacterDataContainerEntity)
    func getCharactersFailure(error: NetworkErrorEntity)
}

protocol MarvelRepository {
    func getCharacters(characterRequest: CharacterRequestEntity?)
}

class MarvelRepositoryImpl: MarvelRepository {
    weak var output: MarvelRepositoryOutput?
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getCharacters(characterRequest: CharacterRequestEntity?) {
        let operation = CharactersOperation(characterRequest: characterRequest, completionSuccess: { [weak self] dataWrapper in
            guard
                let dataWrapper = dataWrapper as? CharactersDataWrapperEntity,
                let dataCotainter = dataWrapper.data else {
                    self?.output?.getCharactersFailure(error: .wrongDataError)
                    return
            }
            self?.output?.getCharactersSuccess(responseData: dataCotainter)
            }, completionFailure: { [weak self] error in
                self?.output?.getCharactersFailure(error: error)
        })
        networkManager.request(operation)
    }
}
