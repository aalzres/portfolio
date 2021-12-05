//
//  MarvelVC.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

struct CharacterItem {
    var name: String
}

class MarvelVC: UIViewController {
    private let presenter: MarvelPresenter
    
    private lazy var itemsTable: UITableView = {
        let itemsTable = UITableView()
        itemsTable.dataSource = self
        itemsTable.prefetchDataSource = self
        itemsTable.backgroundColor = .white
        itemsTable.register(MarvelTableCell.self, forCellReuseIdentifier: Constants.cellId)
        return itemsTable
    }()
    
    private var isRunningRequest = false
    private var responseData: CharacterDataContainerEntity? = nil
    private lazy var characterItems: [CharacterItem] = []
    private lazy var characterParams = CharacterParamsEntity()
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.delegate = self
        return searchBar
    }()
    
    init(presenter: MarvelPresenter) {
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
        
        setupView()
    }
    //MARK: - Setups
    private func setupTitleView() {
        title = "marvel_title_view".localized()
    }
    
    private func configNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode =  .always
        showSearchBarButton(shouldShow: true)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        setupTable()
    }
    
    private func setupTable() {
        itemsTable.separatorInset.right = itemsTable.separatorInset.left
        itemsTable.anchor(view,
                          top: view.safeAreaLayoutGuide.topAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          leading: view.leadingAnchor,
                          trailing: view.trailingAnchor)
    }
}
// MARK: - Functions
extension MarvelVC {
    private func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                     target: self,
                                                                     action: #selector(self.handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.searchBar.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)})
        }
    }
    
    private func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    private func getCharacters() {
        if !isRunningRequest  {
            isRunningRequest.toggle()
            presenter.getCharacters(characterParams: self.characterParams)
        }
    }
    
    private func clearTable() {
        characterItems = []
        itemsTable.reloadData()
    }
}
// MARK: - MarvelPresenterOutput
extension MarvelVC: MarvelPresenterOutput {
    func getCharactersSuccess(responseData: CharacterDataContainerEntity) {
        isRunningRequest.toggle()
        self.responseData = responseData
        
        guard let characters = responseData.results else { return }
        for character in characters {
            guard let name = character.name else { return }
            characterItems.append(CharacterItem(name: name))
        }
        
        itemsTable.reloadData()
    }
    
    func getCharactersFailure(_ error: String) {
        isRunningRequest.toggle()
        debugPrint(error)
    }
}
// MARK: - UITableViewDataSource
extension MarvelVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath) as? MarvelTableCell else { return UITableViewCell() }
        
        guard let character = characterItems[indexPath.row] as CharacterItem? else { return UITableViewCell() }
        cell.characterName.text = character.name
        cell.selectionStyle = .none
        
        return cell
    }
}
// MARK: - UITableViewDataSourcePrefetching
extension MarvelVC: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        let needsFetch = indexPaths.contains { $0.row >= self.characterItems.count-1 }
        guard let total = responseData?.total else { return }
        
        if needsFetch && characterItems.count < total {
            characterParams.offset = characterItems.count
            getCharacters()
        }
    }
}
// MARK: - UISearchResultsUpdating
extension MarvelVC: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        clearTable()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        characterParams.offset = characterItems.count
        clearTable()
        getCharacters()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        clearTable()
        characterParams.offset = characterItems.count
        characterParams.nameStartsWith = searchText
        
        self.getCharacters()
    }
}
// MARK: - Selectors
extension MarvelVC {
    @objc
    func handleShowSearchBar() {
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
    }
}
// MARK: - Constants
private struct Constants {
    static let cellId = "cellId"
}
