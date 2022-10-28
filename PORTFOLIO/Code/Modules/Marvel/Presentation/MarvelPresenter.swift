//
//  MarvelPresenter.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import Domain
import Architecture

protocol MarvelPresenterOutput: AnyObject {
    func getCharactersSuccess(responseData: CharacterDataContainerEntity)
    func getCharactersFailure(_ error: String)
}

protocol MarvelPresenter {
    func getCharacters(characterParams: CharacterParamsEntity?)
}

class MarvelPresenterImpl: BasePresenter, MarvelPresenter {
    private let router: MarvelRouter
    private let interactor: Marvel
    
    weak var output: MarvelPresenterOutput?
    
    init(router: MarvelRouter, interactor: Marvel) {
        self.interactor = interactor
        self.router = router
    }
    
    func getCharacters(characterParams: CharacterParamsEntity?) {
        interactor.getCharacters(characterParams: characterParams)
    }
}

extension MarvelPresenterImpl: MarvelOutput {
    func getCharactersSuccess(responseData: CharacterDataContainerEntity) {
        output?.getCharactersSuccess(responseData: responseData)
    }
    
    func getCharactersFailure(error: NetworkErrorEntity) {
        output?.getCharactersFailure(error.errorDescription)
    }
}
