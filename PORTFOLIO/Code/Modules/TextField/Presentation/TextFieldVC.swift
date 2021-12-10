//
//  TextFieldVC.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 19/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit
import UserInterface

class TextFieldVC: UIKeyboardController {
    private let presenter: TextFieldPresenter
    
    private lazy var contentView = UIView()
    
    private lazy var headerView: UILabel = {
        let headerView = UILabel()
        headerView.font = .title
        headerView.textColor = .black
        headerView.text = "text_field_header_view".localized()
        return headerView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .inputPrimary
        nameLabel.textColor = .black
        nameLabel.text = "text_field_name_label".localized()
        return nameLabel
    }()
    private lazy var nameInput: UITextField = {
        let nameInput = UITextField()
        nameInput.font = .inputSecondary
        nameInput.textColor = .black
        nameInput.addLine(position: .bottom)
        return nameInput
    }()
    
    private lazy var documentNumberLabel: UILabel = {
        let documentNumberLabel = UILabel()
        documentNumberLabel.font = .inputPrimary
        documentNumberLabel.textColor = .black
        documentNumberLabel.text = "text_field_document_number_label".localized()
        return documentNumberLabel
    }()
    private lazy var documentNumberInput: UITextField = {
        let documentNumberInput = UITextField()
        documentNumberInput.font = .inputSecondary
        documentNumberInput.textColor = .black
        documentNumberInput.addLine(position: .bottom)
        documentNumberInput.autocorrectionType = .no
        documentNumberInput.keyboardType = .namePhonePad
        documentNumberInput.returnKeyType = .next
        documentNumberInput.clearButtonMode = .whileEditing
        documentNumberInput.delegate = self
        return documentNumberInput
    }()
    
    private lazy var dateOfBirthLabel: UILabel = {
        let dateOfBirthLabel = UILabel()
        dateOfBirthLabel.font = .inputPrimary
        dateOfBirthLabel.textColor = .black
        dateOfBirthLabel.text = "text_field_date_of_birth".localized()
        return dateOfBirthLabel
    }()
    private lazy var dateOfBirthInput: UIDatePicker = {
        let dateOfBirthInput = UIDatePicker()
        dateOfBirthInput.backgroundColor = .white
        dateOfBirthInput.setValue(UIColor.black, forKey: "textColor")
        dateOfBirthInput.datePickerMode = .date
        return dateOfBirthInput
    }()
    
    private lazy var mailLabel: UILabel = {
        let mailLabel = UILabel()
        mailLabel.font = .inputPrimary
        mailLabel.textColor = .black
        mailLabel.text = "text_field_mail".localized()
        return mailLabel
    }()
    private lazy var mailInput: UITextField = {
        let mailInput = UITextField()
        mailInput.font = .inputSecondary
        mailInput.textColor = .black
        mailInput.addLine(position: .bottom)
        return mailInput
    }()
    
    private lazy var addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.font = .inputPrimary
        addressLabel.textColor = .black
        addressLabel.text = "text_field_address".localized()
        return addressLabel
    }()
    private lazy var addressInput: UITextField = {
        let addressInput = UITextField()
        addressInput.font = .inputSecondary
        addressInput.textColor = .black
        addressInput.addLine(position: .bottom)
        return addressInput
    }()
    
    private lazy var sexLabel: UILabel = {
        let sexLabel = UILabel()
        sexLabel.font = .inputPrimary
        sexLabel.textColor = .black
        sexLabel.text = "text_field_sex".localized()
        return sexLabel
    }()
    private lazy var sexInput: UISegmentedControl = {
        let items = [
            "text_field_sex_male".localized(),
            "text_field_sex_female".localized()
        ]
        let sexInput = UISegmentedControl(items: items)
        sexInput.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        sexInput.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        return sexInput
    }()
    
    private lazy var telLabel: UILabel = {
        let telLabel = UILabel()
        telLabel.font = .inputPrimary
        telLabel.textColor = .black
        telLabel.text = "text_field_tel".localized()
        return telLabel
    }()
    private lazy var telInput: UITextField = {
        let telInput = UITextField()
        telInput.font = .inputSecondary
        telInput.textColor = .black
        telInput.addLine(position: .bottom)
        return telInput
    }()
    
    private lazy var nationalityLabel: UILabel = {
        let nationalityLabel = UILabel()
        nationalityLabel.font = .inputPrimary
        nationalityLabel.textColor = .black
        nationalityLabel.text = "text_field_nationality".localized()
        return nationalityLabel
    }()
    private lazy var nationalityInput: UITextField = {
        let nationalityInput = UITextField()
        nationalityInput.font = .inputSecondary
        nationalityInput.textColor = .black
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
    }
    //MARK: - Setups
    private func setupTitleView() { title = "main_screen_text_field".localized() }
    
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
                         top: contentView.topAnchor, paddingTop: .paddingS,
                         leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                         trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
        
    }
    
    private func setupName() {
        nameLabel.anchor(contentView,
                         top: headerView.bottomAnchor, paddingTop: .paddingM,
                         leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                         trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
        
        nameInput.anchor(contentView,
                         top: nameLabel.bottomAnchor, paddingTop: .paddingS,
                         leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                         trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
    }
    
    private func setupDocumentNumber() {
        documentNumberLabel.anchor(contentView,
                                   top: nameInput.bottomAnchor, paddingTop: .paddingM,
                                   leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                                   trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
        
        documentNumberInput.anchor(contentView,
                                   top: documentNumberLabel.bottomAnchor, paddingTop: .paddingS,
                                   leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                                   trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
    }
    
    private func setupDateOfBirth() {
        dateOfBirthLabel.anchor(contentView,
                                top: documentNumberInput.bottomAnchor, paddingTop: .paddingM,
                                leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                                trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
        
        dateOfBirthInput.anchor(contentView,
                                top: dateOfBirthLabel.bottomAnchor, paddingTop: .paddingS,
                                leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                                trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
    }
    
    private func setupMail() {
        mailLabel.anchor(contentView,
                         top: dateOfBirthInput.bottomAnchor, paddingTop: .paddingM,
                         leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                         trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
        
        mailInput.anchor(contentView,
                         top: mailLabel.bottomAnchor, paddingTop: .paddingS,
                         leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                         trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
    }
    
    private func setupAddress() {
        addressLabel.anchor(contentView,
                            top: mailInput.bottomAnchor, paddingTop: .paddingM,
                            leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                            trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
        
        addressInput.anchor(contentView,
                            top: addressLabel.bottomAnchor, paddingTop: .paddingS,
                            leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                            trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
    }
    
    private func setupSex() {
        sexLabel.anchor(contentView,
                        top: addressInput.bottomAnchor, paddingTop: .paddingM,
                        leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                        trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
        
        sexInput.anchor(contentView,
                        top: sexLabel.bottomAnchor, paddingTop: .paddingS,
                        leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                        trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
    }
    
    private func setupTel() {
        telLabel.anchor(contentView,
                        top: sexInput.bottomAnchor, paddingTop: .paddingM,
                        leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                        trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
        
        telInput.anchor(contentView,
                        top: telLabel.bottomAnchor, paddingTop: .paddingS,
                        leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                        trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
    }
    
    private func setupNationality() {
        nationalityLabel.anchor(contentView,
                                top: telInput.bottomAnchor, paddingTop: .paddingM,
                                leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                                trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
        
        nationalityInput.anchor(contentView,
                                top: nationalityLabel.bottomAnchor, paddingTop: .paddingS,
                                bottom: contentView.bottomAnchor, paddingBottom: -.paddingS,
                                leading: contentView.leadingAnchor, paddingLeading: .paddingS,
                                trailing: contentView.trailingAnchor, paddingTrailing: -.paddingS)
    }
}
// MARK: - Output
extension TextFieldVC: TextFieldPresenterOutput {}
// MARK: - TextField Delegate
extension TextFieldVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case documentNumberInput:
            return checkLengthDocumentNumber(textField, range, string)
        default:
            return true;
        }
    }
    
    private func checkLengthDocumentNumber(_ textField: UITextField, _ range: NSRange, _ string: String) -> Bool{
        let maxLength = 9
        
        guard let currentText = textField.text,
              let stringRange = Range(range, in: currentText)
        else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= maxLength
    }
}
