//
//  TextFieldVC.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 19/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit

class TextFieldVC: UIKeyboardController {
    private let presenter: TextFieldPresenter
    
    private lazy var contentView = UIView()
    
    private lazy var headerView: UILabel = {
        let headerView = UILabel()
        headerView.text = "text_field_header_view".localized()
        return headerView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "text_field_name_label".localized()
        return nameLabel
    }()
    private lazy var nameInput: UITextField = {
        let nameInput = UITextField()
        nameInput.addLine(position: .bottom)
        return nameInput
    }()
    
    private lazy var documentNumberLabel: UILabel = {
        let documentNumberLabel = UILabel()
        documentNumberLabel.text = "text_field_document_number_label".localized()
        return documentNumberLabel
    }()
    private lazy var documentNumberInput: UITextField = {
        let documentNumberInput = UITextField()
        documentNumberInput.addLine(position: .bottom)
        return documentNumberInput
    }()
    
    private lazy var dateOfBirthLabel: UILabel = {
        let dateOfBirthLabel = UILabel()
        dateOfBirthLabel.text = "text_field_date_of_birth".localized()
        return dateOfBirthLabel
    }()
    private lazy var dateOfBirthInput: UITextField = {
        let dateOfBirthInput = UITextField()
        dateOfBirthInput.addLine(position: .bottom)
        return dateOfBirthInput
    }()
    
    private lazy var mailLabel: UILabel = {
        let mailLabel = UILabel()
        mailLabel.text = "text_field_mail".localized()
        return mailLabel
    }()
    private lazy var mailInput: UITextField = {
        let mailInput = UITextField()
        mailInput.addLine(position: .bottom)
        return mailInput
    }()
    
    private lazy var addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.text = "text_field_address".localized()
        return addressLabel
    }()
    private lazy var addressInput: UITextField = {
        let addressInput = UITextField()
        addressInput.addLine(position: .bottom)
        return addressInput
    }()
    
    private lazy var sexLabel: UILabel = {
        let sexLabel = UILabel()
        sexLabel.text = "text_field_sex".localized()
        return sexLabel
    }()
    private lazy var sexInput: UITextField = {
        let sexInput = UITextField()
        sexInput.addLine(position: .bottom)
        return sexInput
    }()
    
    private lazy var telLabel: UILabel = {
        let telLabel = UILabel()
        telLabel.text = "text_field_tel".localized()
        return telLabel
    }()
    private lazy var telInput: UITextField = {
        let telInput = UITextField()
        telInput.addLine(position: .bottom)
        return telInput
    }()
    
    private lazy var nationalityLabel: UILabel = {
        let nationalityLabel = UILabel()
        nationalityLabel.text = "text_field_nationality".localized()
        return nationalityLabel
    }()
    private lazy var nationalityInput: UITextField = {
        let nationalityInput = UITextField()
        nationalityInput.addLine(position: .bottom)
        return nationalityInput
    }()
    
    init(presenter: TextFieldPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
        setupTitleView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configNavController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = PColor.white
        
        setupView()
    }
    //MARK: - Setups
    private func setupTitleView() { title = "main_screen_text_field".localized() }
    
    private func configNavController() {
        navigationItem.largeTitleDisplayMode =  .never
    }
    
    private func setupView() {
        setupContentView()
        setupHeaderView()
        setupName()
        setupDocumentNumber()
        setupDateOfBirth()
        setupMail()
        setupAddress()
        setupSex()
        setupTel()
        setupNationality()
    }
    
    private func setupContentView() {
        scrollView.anchor(view,
                          top: view.safeAreaLayoutGuide.topAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          leading: view.leadingAnchor,
                          trailing: view.trailingAnchor)
        
        contentView.anchor(scrollView,
                           top: scrollView.topAnchor,
                           bottom: scrollView.bottomAnchor,
                           leading: scrollView.leadingAnchor,
                           trailing: scrollView.trailingAnchor,
                           width: scrollView.widthAnchor)
    }
    
    private func setupHeaderView() {
        headerView.anchor(contentView,
                         top: contentView.topAnchor, paddingTop: PDimen.paddingS,
                         leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                         trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        
    }
    
    private func setupName() {
        nameLabel.anchor(contentView,
                         top: headerView.bottomAnchor, paddingTop: PDimen.paddingM,
                         leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                         trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        
        nameInput.anchor(contentView,
                         top: nameLabel.bottomAnchor, paddingTop: PDimen.paddingS,
                         leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                         trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
    }
    
    private func setupDocumentNumber() {
        documentNumberLabel.anchor(contentView,
                                   top: nameInput.bottomAnchor, paddingTop: PDimen.paddingM,
                                   leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                                   trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        
        documentNumberInput.anchor(contentView,
                                   top: documentNumberLabel.bottomAnchor, paddingTop: PDimen.paddingS,
                                   leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                                   trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
    }
    
    private func setupDateOfBirth() {
        dateOfBirthLabel.anchor(contentView,
                                top: documentNumberInput.bottomAnchor, paddingTop: PDimen.paddingM,
                                leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                                trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        
        dateOfBirthInput.anchor(contentView,
                                top: dateOfBirthLabel.bottomAnchor, paddingTop: PDimen.paddingS,
                                leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                                trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
    }
    
    private func setupMail() {
        mailLabel.anchor(contentView,
                         top: dateOfBirthInput.bottomAnchor, paddingTop: PDimen.paddingM,
                         leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                         trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        
        mailInput.anchor(contentView,
                         top: mailLabel.bottomAnchor, paddingTop: PDimen.paddingS,
                         leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                         trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
    }
    
    private func setupAddress() {
        addressLabel.anchor(contentView,
                            top: mailInput.bottomAnchor, paddingTop: PDimen.paddingM,
                            leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                            trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        
        addressInput.anchor(contentView,
                            top: addressLabel.bottomAnchor, paddingTop: PDimen.paddingS,
                            leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                            trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
    }
    
    private func setupSex() {
        sexLabel.anchor(contentView,
                        top: addressInput.bottomAnchor, paddingTop: PDimen.paddingM,
                        leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                        trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        
        sexInput.anchor(contentView,
                        top: sexLabel.bottomAnchor, paddingTop: PDimen.paddingS,
                        leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                        trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
    }
    
    private func setupTel() {
        telLabel.anchor(contentView,
                        top: sexInput.bottomAnchor, paddingTop: PDimen.paddingM,
                        leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                        trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        
        telInput.anchor(contentView,
                        top: telLabel.bottomAnchor, paddingTop: PDimen.paddingS,
                        leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                        trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
    }
    
    private func setupNationality() {
        nationalityLabel.anchor(contentView,
                                top: telInput.bottomAnchor, paddingTop: PDimen.paddingM,
                                leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                                trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
        
        nationalityInput.anchor(contentView,
                                top: nationalityLabel.bottomAnchor, paddingTop: PDimen.paddingS,
                                bottom: contentView.bottomAnchor, paddingBottom: -PDimen.paddingS,
                                leading: contentView.leadingAnchor, paddingLeading: PDimen.paddingS,
                                trailing: contentView.trailingAnchor, paddingTrailing: -PDimen.paddingS)
    }
}
// MARK: - Output
extension TextFieldVC: TextFieldPresenterOutput {}

