//
//  Marvel.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MarvelOutput: class {
    func getCharactersSuccess(responseData: CharacterDataContainerEntity)
    func getCharactersFailure(error: NetworkErrorEntity)
}

protocol Marvel {
    func getCharacters(characterRequest: CharacterRequestEntity?)
}

class MarvelImpl: Marvel {
    private let repository: MarvelRepository
    
    weak var output: MarvelOutput?
    
    init(repository: MarvelRepository) {
        self.repository = repository
    }
    
    func getCharacters(characterRequest: CharacterRequestEntity?) {
        repository.getCharacters(characterRequest: characterRequest)
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
