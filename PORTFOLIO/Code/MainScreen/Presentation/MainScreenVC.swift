//
//  MainScreenVC.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 16/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

class MainScreenVC: UIViewController {
    private let presenter: MainScreenPresenter
    
    private lazy var textFieldView: UIView = {
        let textFieldView = UIView()
        textFieldView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goTextFieldVC)))
        return textFieldView
    }()
    private lazy var textFieldLabel: UILabel = {
        let textFieldLabel = UILabel()
        textFieldLabel.font = PFont.primary
        textFieldLabel.text = "main_screen_text_field".localized()
        return textFieldLabel
    }()
    
    private lazy var arrow: UIImageView = {
        let arrow = UIImageView(image: UIImage(named: "arrow"))
        return arrow
    }()
    
    private lazy var marvelView: UIView = {
        let marvelView = UIView()
        marvelView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goMarvel)))
        return marvelView
    }()
    private lazy var marvelLabel: UILabel = {
        let marvelLabel = UILabel()
        marvelLabel.font = PFont.primary
        marvelLabel.text = "main_screen_marvel".localized()
        return marvelLabel
    }()
    private lazy var arrowMarvel: UIImageView = {
        let arrow = UIImageView(image: UIImage(named: "arrow"))
        return arrow
    }()
    
    init(presenter: MainScreenPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
        setupTitleView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = PColor.white
        
        setupView()
    }
    
    //MARK: - Setups
    private func setupTitleView() {
        title = "main_screen_title".localized()
    }
    
    private func configNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode =  .always
    }
    
    private func setupView() {
        setupTextFieldView()
        setupMarvelView()
    }
    
    private func setupTextFieldView() {
        textFieldView.anchor(view,
                             top: view.safeAreaLayoutGuide.topAnchor, paddingTop: PDimen.paddingS,
                             leading: view.leadingAnchor, paddingLeading: PDimen.paddingS,
                             trailing: view.trailingAnchor, paddingTrailing: -PDimen.paddingS,
                             heightConstant: PDimen.componentButtonHeight)
        
        textFieldLabel.anchor(textFieldView,
                              top: textFieldView.topAnchor, paddingTop: PDimen.paddingS,
                              bottom: textFieldView.bottomAnchor, paddingBottom: -PDimen.paddingS,
                              leading: textFieldView.leadingAnchor, paddingLeading: PDimen.paddingS)
        
        arrow.anchor(textFieldView,
                     trailing: textFieldView.trailingAnchor, paddingTrailing: -PDimen.paddingS,
                     centerY: textFieldView.centerYAnchor)
    }
    
    private func setupMarvelView() {
        marvelView.anchor(view,
                          top: textFieldView.bottomAnchor, paddingTop: PDimen.paddingS,
                          leading: view.leadingAnchor, paddingLeading: PDimen.paddingS,
                          trailing: view.trailingAnchor, paddingTrailing: -PDimen.paddingS,
                          heightConstant: PDimen.componentButtonHeight)
        
        marvelLabel.anchor(marvelView,
                           top: marvelView.topAnchor, paddingTop: PDimen.paddingS,
                           bottom: marvelView.bottomAnchor, paddingBottom: -PDimen.paddingS,
                           leading: marvelView.leadingAnchor, paddingLeading: PDimen.paddingS)
        
        arrowMarvel.anchor(marvelView,
                           trailing: marvelView.trailingAnchor, paddingTrailing: -PDimen.paddingS,
                           centerY: marvelView.centerYAnchor)
    }
}
// MARK: - Output
extension MainScreenVC: MainScreenPresenterOutput {}
// MARK: - Selector
extension MainScreenVC {
    @objc
    func goTextFieldVC() {
        presenter.goTextFieldVC()
    }
    
    @objc
    func goMarvel() {
        presenter.goMarvel()
    }
}
