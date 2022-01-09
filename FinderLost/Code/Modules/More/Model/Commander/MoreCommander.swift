//
//  MoreCommander.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 9/1/22.
//  
//

import RxSwift
import RxCocoa

import Architecture

protocol MoreCommander {
    var viewAction: AnyObserver<MoreViewAction> { get }
    var model: Driver<MoreViewState> { get }
}

final class MoreCommanderImpl: BaseCommander, MoreCommander {
    private let actionSubject = PublishSubject<MoreViewAction>()
    var viewAction: AnyObserver<MoreViewAction> { actionSubject.asObserver() }

    private let stateSubject: BehaviorSubject<MoreViewState>
    var model: Driver<MoreViewState> { stateSubject.asDriverIgnoringErrors() }

    init(
        coordinator: MoreCoordinator,
        interactor: MoreInteractor
    ) {
        stateSubject = .init(value: .init())
        let viewAction = actionSubject.asObserver().share()
        
        super.init()
        
        commands.append(
            contentsOf: [
                MoreScreenTimeCommand(
                    viewAction: viewAction
                ),
                MoreBackCommand(
                    viewAction: viewAction
                )
            ]
        )
        
        operations.append(
            contentsOf: [
                MoreErrorOperation(
                    interactor: interactor,
                    stateSubject: stateSubject
                ),
                MoreLoadingOperation(
                    interactor: interactor,
                    stateSubject: stateSubject
                )
            ]
        )
    }
}
