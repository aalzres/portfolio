//
//  SplashVC.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 15/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    private let presenter: SplashPresenter
    
    init(presenter: SplashPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
    }
    //MARK: - Setups
    private func setupView() {
        presenter.goMainScreen()
    }
}

extension SplashVC: SplashPresenterOutput {}
