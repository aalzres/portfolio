//
//  MarvelRepository.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MarvelRepositoryOutput: AnyObject {
    func getCharactersSuccess(responseData: CharacterDataContainerEntity)
    func getCharactersFailure(error: NetworkErrorEntity)
}

protocol MarvelRepository {
    func getCharacters(characterParams: CharacterParamsEntity?)
}

class MarvelRepositoryImpl: MarvelRepository {
    weak var output: MarvelRepositoryOutput?
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getCharacters(characterParams: CharacterParamsEntity?) {
        let operation = CharactersOperation(characterParams: characterParams, completionSuccess: { [weak self] dataWrapper in
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
