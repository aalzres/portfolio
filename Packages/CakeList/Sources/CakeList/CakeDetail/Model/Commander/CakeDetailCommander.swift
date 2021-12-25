//
//  CakeDetailCommander.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 24/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import RxCocoa

import Architecture

protocol CakeDetailCommander {
    var viewAction: AnyObserver<CakeDetailViewAction> { get }
    var model: Driver<CakeDetailViewState> { get }
}

final class CakeDetailCommanderImpl: BaseCommander, CakeDetailCommander {
    private let actionSubject = PublishSubject<CakeDetailViewAction>()
    var viewAction: AnyObserver<CakeDetailViewAction> { actionSubject.asObserver() }

    private let stateSubject: BehaviorSubject<CakeDetailViewState>
    var model: Driver<CakeDetailViewState> { stateSubject.asDriverIgnoringErrors() }

    init(
        coordinator: CakeDetailCoordinator,
        interactor: CakeDetailInteractor
    ) {
        stateSubject = .init(value: .init())
        let viewAction = actionSubject.asObserver().share()
        
        super.init()
        
        commands.append(
            contentsOf: [
                CakeDetailGetCommand(
                    viewAction: viewAction,
                    interactor: interactor
                ),
                CakeDetailScreenTimeCommand(
                    viewAction: viewAction
                ),
                CakeDetailBackCommand(
                    viewAction: viewAction
                )
            ]
        )
        
        operations.append(
            contentsOf: [
                CakeDetailGetOperation(
                    interactor: interactor,
                    stateSubject: stateSubject
                ),
                CakeDetailErrorOperation(
                    interactor: interactor,
                    stateSubject: stateSubject
                ),
                CakeDetailLoadingOperation(
                    interactor: interactor,
                    stateSubject: stateSubject
                )
            ]
        )
    }
}
