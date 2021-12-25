//
//  BaseViewController.swift
//
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import UIKit

import RxSwift
import RxCocoa

import UserInterface

public enum UIViewControllerLyfeCycle {
    case notLoaded
    case viewWillAppear
    case viewDidAppear
    case viewDidLoad
    case viewWillDisappear
    case viewDidDisappear
}

public protocol BaseViewController: AnyObject {
    var lifeCycleObservable: Observable<UIViewControllerLyfeCycle> { get }
    var onBack: Driver<Void> { get }
    var screenTime: Driver<Int> { get }
    var closeNavigation: Driver<Void> { get }
}

open class BaseViewControllerImpl: UIViewController, BaseViewController {
    open var backgroundColor: UIColor? { .background }
    open var titleView: String { "" }
    open var isNavigationBarHidden: Bool { false }
    private var internalDidAppearDate: Date?

    private var screenTimeSubject = PublishSubject<Int>()
    public var screenTime: Driver<Int> { screenTimeSubject.asDriverIgnoringErrors() }

    private var internalLyfeCycle: BehaviorRelay<UIViewControllerLyfeCycle> = BehaviorRelay<UIViewControllerLyfeCycle>(value: .notLoaded)
    public lazy var lifeCycleObservable: Observable<UIViewControllerLyfeCycle> = {
        internalLyfeCycle.asObservable()
    }()

    private var backPublishSubject = PublishSubject<Void>()
    public var onBack: Driver<Void> {
        backPublishSubject.asDriverIgnoringErrors()
    }

    private var closePublishSubject = PublishSubject<Void>()
    public var closeNavigation: Driver<Void> {
        closePublishSubject.asDriverIgnoringErrors()
    }

    private lazy var activityIndicator = ActivityIndicatorView()
    public lazy var loadingStatusSubject = PublishSubject<Bool>()

    public var presenter: AnyObject?

    open override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        internalLyfeCycle.accept(.viewDidLoad)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.rx.isNavigationBarHidden.onNext(isNavigationBarHidden)
        internalLyfeCycle.accept(.viewWillAppear)
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        internalDidAppearDate = Date()
        internalLyfeCycle.accept(.viewDidAppear)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        internalLyfeCycle.accept(.viewWillDisappear)
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        internalLyfeCycle.accept(.viewDidDisappear)
        if let time = internalDidAppearDate?.millisecondsDifferenceSinceNow {
            screenTimeSubject.onNext(time)
        }
    }

    deinit {
        BaseDeinit.shared.printDeinit(self)
    }

    @objc open dynamic func setupView() {
        view.backgroundColor = backgroundColor
        title = titleView
        addAllSubviews()
        addAllConstraints()
        bind()
    }

    @objc open dynamic func addAllSubviews() {
        view.addSubview(activityIndicator)
    }

    @objc open dynamic func addAllConstraints() {
        activityIndicator.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    open func bind() {
        bindActivityIndicator()
        bindBackButton()
        bindState()
        bindActions()
    }

    private func bindActivityIndicator() {
        loadingStatusSubject
            .distinctUntilChanged()
            .bind(to: activityIndicator.rx.loadingStatus)
            .disposed(by: rx.disposeBag)

        loadingStatusSubject
            .not()
            .distinctUntilChanged()
            .bind(to: view.rx.isUserInteractionEnabled)
            .disposed(by: rx.disposeBag)
    }

    private func bindBackButton() {
        navigationItem.leftBarButtonItem?.rx.tap
            .bind(to: backPublishSubject)
            .disposed(by: rx.disposeBag)
    }

    open func bindState() { }
    open func bindActions() { }
}
