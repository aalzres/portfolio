//
//  CakeListCommander.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import RxCocoa

import Architecture

protocol CakeListCommander {
    var viewAction: AnyObserver<CakeListViewAction> { get }
    var model: Driver<CakeListViewState> { get }
}

final class CakeListCommanderImpl: BaseCommander, CakeListCommander {
    private let actionSubject = PublishSubject<CakeListViewAction>()
    var viewAction: AnyObserver<CakeListViewAction> { actionSubject.asObserver() }
    
    private let stateSubject: BehaviorSubject<CakeListViewState>
    var model: Driver<CakeListViewState> { stateSubject.asDriverIgnoringErrors() }
    
    init(
        coordinator: CakeListCoordinator,
        interactor: CakeListInteractor
    ) {
        stateSubject = .init(value: .init())
        let viewAction = actionSubject.asObserver().share()
        
        super.init()
        
        commands.append(
            contentsOf: [
                CakeListTapCakeCommand(
                    viewAction: viewAction,
                    coordinator: coordinator
                ),
                CakeListGetCommand(
                    viewAction: viewAction,
                    interator: interactor
                ),
                CakeListScreenTimeCommand(
                    viewAction: viewAction
                ),
                CakeListBackCommand(
                    viewAction: viewAction
                )
            ]
        )
        
        operations.append(
            contentsOf: [
                CakeListGetOperation(
                    interactor: interactor,
                    stateSubject: stateSubject
                ),
                CakeListErrorOperation(
                    interactor: interactor,
                    stateSubject: stateSubject
                ),
                CakeListLoadingOperation(
                    interactor: interactor,
                    stateSubject: stateSubject
                )
            ]
        )
    }
}
