//
//  ModuleCakeCommander.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//  Copyright © 2021 aalzres. All rights reserved.
//

import RxSwift
import RxCocoa
import Architecture

protocol ModuleCakeCommander {
    var viewAction: AnyObserver<ModuleCakeViewAction> { get }
    var model: Driver<ModuleCakeViewState> { get }
}

final class ModuleCakeCommanderImpl: BaseCommander, ModuleCakeCommander {
    private let actionSubject = PublishSubject<ModuleCakeViewAction>()
    var viewAction: AnyObserver<ModuleCakeViewAction> { actionSubject.asObserver() }

    private let stateSubject: BehaviorSubject<ModuleCakeViewState>
    var model: Driver<ModuleCakeViewState> { stateSubject.asDriverIgnoringErrors() }

    init(
        coordinator: ModuleCakeCoordinator,
        interactor: ModuleCakeInteractor
    ) {
        stateSubject = .init(value: .init())
        let viewAction = actionSubject.asObserver().share()
        
        super.init()
        
        commands.append(
            contentsOf: [
                ModuleCakeGetCommand(
                    viewAction: viewAction,
                    interator: interactor
                ),
                ModuleCakeScreenTimeCommand(
                    viewAction: viewAction
                ),
                ModuleCakeBackCommand(
                    viewAction: viewAction
                )
            ]
        )
        
        operations.append(
            contentsOf: [
                ModuleCakeGetOperation(
                    interactor: interactor,
                    coordinator: coordinator
                ),
                ModuleCakeGetErrorOperation(
                    interactor: interactor,
                    stateSubject: stateSubject
                ),
                ModuleCakeLoadingOperation(
                    interactor: interactor,
                    stateSubject: stateSubject
                )
            ]
        )
    }
}
