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
        itemsTable.register(MarvelTableCell.self, forCellReuseIdentifier: Constants.cellId)
        return itemsTable
    }()
    
    private var characterItems: [CharacterItem] = []
    private var characterRequest = CharacterRequestEntity()
    
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
        
        presenter.getCharacters(characterRequest: characterRequest)
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
                          leading: view.leadingAnchor, paddingLeading: PDimen.paddingS,
                          trailing: view.trailingAnchor, paddingTrailing: -PDimen.paddingS)
    }
}
// MARK: - MarvelPresenterOutput
extension MarvelVC: MarvelPresenterOutput {
    func getCharactersSuccess(characters: [CharacterEntity]) {
        for character in characters {
            guard let name = character.name else { return }
            characterItems.append(CharacterItem(name: name))
        }
        
        itemsTable.reloadData()
    }
    
    func getCharactersFailure(_ error: String) {
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
        
        if needsFetch {
            characterRequest.offset = characterItems.count
            presenter.getCharacters(characterRequest: characterRequest)
        }
    }
}
// MARK: - Constans
private struct Constants {
    static let cellId = "cellId"
}
