//
//  Marvel.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MarvelOutput: AnyObject {
    func getCharactersSuccess(responseData: CharacterDataContainerEntity)
    func getCharactersFailure(error: NetworkErrorEntity)
}

protocol Marvel {
    func getCharacters(characterParams: CharacterParamsEntity?)
}

class MarvelImpl: Marvel {
    private let repository: MarvelRepository
    
    weak var output: MarvelOutput?
    
    init(repository: MarvelRepository) {
        self.repository = repository
    }
    
    func getCharacters(characterParams: CharacterParamsEntity?) {
        repository.getCharacters(characterParams: characterParams)
    }
}

extension MarvelImpl: MarvelRepositoryOutput {
    func getCharactersSuccess(responseData: CharacterDataContainerEntity) {
        output?.getCharactersSuccess(responseData: responseData)
    }
    
    func getCharactersFailure(error: NetworkErrorEntity) {
        output?.getCharactersFailure(error: error)
    }
}
