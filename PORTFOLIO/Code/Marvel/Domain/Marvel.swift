//
//  Marvel.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MarvelOutput: class {
    func getCharactersSuccess(characters: [CharacterEntity])
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
    func getCharactersSuccess(characters: [CharacterEntity]) {
        output?.getCharactersSuccess(characters: characters)
    }
    
    func getCharactersFailure(error: NetworkErrorEntity) {
        output?.getCharactersFailure(error: error)
    }
}
