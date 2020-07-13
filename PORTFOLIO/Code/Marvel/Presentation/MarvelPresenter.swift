//
//  MarvelPresenter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Foundation

protocol MarvelPresenterOutput: class {
    func getCharactersSuccess(characters: [CharacterEntity])
    func getCharactersFailure(_ error: String)
}

protocol MarvelPresenter {
    func getCharacters(characterRequest: CharacterRequestEntity?)
}

class MarvelPresenterImpl: MarvelPresenter {
    private let router: MarvelRouter
    private let interactor: Marvel
    
    weak var output: MarvelPresenterOutput?
    
    init(router: MarvelRouter, interactor: Marvel) {
        self.interactor = interactor
        self.router = router
    }
    
    func getCharacters(characterRequest: CharacterRequestEntity?) {
        interactor.getCharacters(characterRequest: characterRequest)
    }
}

extension MarvelPresenterImpl: MarvelOutput {
    func getCharactersSuccess(characters: [CharacterEntity]) {
        output?.getCharactersSuccess(characters: characters)
    }
    
    func getCharactersFailure(error: NetworkErrorEntity) {
        output?.getCharactersFailure(error.errorDescription)
    }
}
