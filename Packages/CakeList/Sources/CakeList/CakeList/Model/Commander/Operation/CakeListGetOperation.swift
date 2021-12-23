//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import RxSwift
import UIKit

import Architecture
import UserInterface
import Utilities
import Domain

final class CakeListGetOperation: BaseOperation {
    private let interactor: CakeListInteractor
    private let stateSubject: BehaviorSubject<CakeListViewState>

    init(
        interactor: CakeListInteractor,
        stateSubject: BehaviorSubject<CakeListViewState>
    ) {
        self.interactor = interactor
        self.stateSubject = stateSubject
        super.init()

        bind()
    }

    private func bind() {
        interactor.getCakeListItem.elements
            .map(\.cakeViewState)
            .withLatestFrom(stateSubject) { $1.changing(cakeViewState: $0) }
            .bind(to: stateSubject)
            .disposed(by: disposeBag)
    }
}

extension Array where Element == CakeItem {
    var cakeViewState: [CakeRepresentable] {
        var cakeList: [CakeRepresentable] = []

        forEach { cake in
            cakeList.append(
                .init(
                    title: cake.title,
                    description: cake.description,
                    imageUrl: cake.image
                )
            )
        }

        return cakeList.uniqued().sorted(by: \.title)
    }
}
