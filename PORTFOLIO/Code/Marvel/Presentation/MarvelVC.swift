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
        itemsTable.register(MarvelTableCell.self, forCellReuseIdentifier: Constants.cellId)
        return itemsTable
    }()
    private lazy var tableHeader: UILabel = {
        let header = UILabel()
        header.text = "marvel_title_table".localized()
        header.font = PFont.title
        header.textAlignment = .left
        return header
    }()
    
    private var characterItems: [CharacterItem] = []
    
    init(presenter: MarvelPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
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
    private func configNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode =  .always
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        //        var characterRequest = CharacterRequestEntity()
        //        characterRequest.name = "Spider-Man"
        //        presenter.getCharacters(characterRequest: characterRequest)
        
        presenter.getCharacters(characterRequest: nil)
        
        setupTable()
    }
    
    private func setupTable() {
        itemsTable.separatorInset.right = itemsTable.separatorInset.left
        itemsTable.anchor(view,
                          top: view.safeAreaLayoutGuide.topAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          leading: view.leadingAnchor, paddingLeading: PDimen.paddingS,
                          trailing: view.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        
        itemsTable.tableHeaderView = tableHeader
        tableHeader.translatesAutoresizingMaskIntoConstraints = false
        tableHeader.bottomAnchor.constraint(equalTo: itemsTable.topAnchor, constant: Constants.headerBottomMargin).isActive = true
        tableHeader.leadingAnchor.constraint(equalTo: itemsTable.leadingAnchor, constant: PDimen.paddingS).isActive = true
        tableHeader.trailingAnchor.constraint(equalTo: itemsTable.trailingAnchor, constant: -PDimen.paddingS).isActive = true
    }
}

extension MarvelVC: MarvelPresenterOutput {
    func getCharactersSuccess(characters: [CharacterEntity]) {
        for character in characters {
            guard let name = character.name else { return }
            characterItems.append(CharacterItem(name: name))
        }
        
        itemsTable.reloadData()
    }
    
    func getCharactersFailure(_ error: String) {
        print(error)
    }
}
extension MarvelVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath) as? MarvelTableCell else { return UITableViewCell() }
        
        guard let character = characterItems[indexPath.row] as CharacterItem? else { return UITableViewCell() }
        cell.name.text = character.name
        
        return cell
    }
}

private struct Constants {
    static let cellId = "cellId"
    static let headerBottomMargin: CGFloat = 30
}
