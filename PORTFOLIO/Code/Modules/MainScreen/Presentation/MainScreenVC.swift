//
//  MainScreenVC.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate on 16/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

enum MainScreenTarget {
    case goTextView
    case goMarvel
    case goMapKit
    case goCakeList
    case goStatistic
    case goCustomMap
}

struct MainScreenItem {
    var name: String
    var target: MainScreenTarget
}

class MainScreenVC: UIViewController {
    private let presenter: MainScreenPresenter

    private lazy var itemsTable: UITableView = {
        let itemsTable = UITableView()
        itemsTable.dataSource = self
        itemsTable.delegate = self
        itemsTable.separatorStyle = .none
        itemsTable.backgroundColor = .white
        itemsTable.register(MainScreenTableCell.self, forCellReuseIdentifier: Constants.cellId)
        return itemsTable
    }()
    private var menuItems: [MainScreenItem] = [
        MainScreenItem(name: "main_screen_text_field".localized(), target: .goTextView),
        MainScreenItem(name: "main_screen_marvel".localized(), target: .goMarvel),
        MainScreenItem(name: "main_screen_map_kit".localized(), target: .goMapKit),
        MainScreenItem(name: "main_screen_cake_list".localized(), target: .goCakeList),
        MainScreenItem(name: "main_screen_statistic".localized(), target: .goStatistic),
        MainScreenItem(name: "main_screen_custom_map".localized(), target: .goCustomMap)
    ]

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
        view.backgroundColor = .white
        
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
        setupTable()
    }
    
    private func setupTable() {
        itemsTable.separatorInset.right = itemsTable.separatorInset.left
        itemsTable.anchor(view,
                          top: view.safeAreaLayoutGuide.topAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          leading: view.leadingAnchor, paddingLeading: .paddingS,
                          trailing: view.trailingAnchor, paddingTrailing: -.paddingS)
    }
}
// MARK: - Output
extension MainScreenVC: MainScreenPresenterOutput {}
// MARK: - UITableViewDelegate
extension MainScreenVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath) as? MainScreenTableCell else { return UITableViewCell() }
        
        guard let item = menuItems[indexPath.row] as MainScreenItem? else { return UITableViewCell() }
        cell.nameItem.text = item.name
        cell.selectionStyle = .none
        
        return cell
    }
}
// MARK: - UITableViewDelegate
extension MainScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = menuItems[indexPath.row] as MainScreenItem? else { return }
        
        switch item.target {
        case .goTextView:
            presenter.goTextFieldVC()
        case .goMarvel:
            presenter.goMarvel()
        case .goMapKit:
            presenter.goMapKit()
        case .goCakeList:
            presenter.goCakeList()
        case .goStatistic:
            presenter.goStatistic()
        case .goCustomMap:
            presenter.goCustomMap()
        }
    }
}
// MARK: - Constants
private struct Constants {
    static let cellId = "cellId"
}
