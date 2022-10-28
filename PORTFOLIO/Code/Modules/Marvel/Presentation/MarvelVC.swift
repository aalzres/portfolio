//
//  MarvelVC.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 10/07/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit
import Domain
import Architecture
import Utilities

struct CharacterItem {
    var name: String
}

final class MarvelVC: BaseViewControllerImpl {
    var oldPresenter: MarvelPresenter?
    override var titleView: String { "marvel_title_view".localized() }
    private lazy var itemsTable = UITableView()
        .set(\.dataSource, self)
        .set(\.prefetchDataSource, self)
        .set(\.backgroundColor, .background)
        .set(\.register, MarvelTableCell.self)
        .set(\.separatorInset, .init())
    
    private var isRunningRequest = false
    private var responseData: CharacterDataContainerEntity? = nil
    private lazy var characterItems: [CharacterItem] = []
    private lazy var characterParams = CharacterParamsEntity()
    private lazy var searchBar = UISearchBar()
        .set(\.delegate, self)
        .sizeSelfToFit()

    override func setupView() {
        super.setupView()
        view.backgroundColor = .white
        configNavBar()
    }

    private func configNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode =  .always
        showSearchBarButton(shouldShow: true)
    }

    override func addAllSubviews() {
        super.addAllSubviews()
        view.addSubview(itemsTable)
    }

    override func addAllConstraints() {
        super.addAllConstraints()
        itemsTable.snp.makeConstraints {
            $0.vertical.equalTo(safeArea)
            $0.horizontal.equalToSuperview()
        }
    }
}
// MARK: - Functions
extension MarvelVC {
    private func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .search,
                target: self,
                action: #selector(self.handleShowSearchBar)
            )
        } else {
            navigationItem.rightBarButtonItem = nil
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.searchBar.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
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
            oldPresenter?.getCharacters(characterParams: characterParams)
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
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: MarvelTableCell.reuseIdentifier,
                for: indexPath
            ) as? MarvelTableCell
        else { return .init() }
        
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
