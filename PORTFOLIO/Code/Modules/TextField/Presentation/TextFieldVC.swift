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
    
    private lazy var headerView = UILabel()
        .set(\.font, .title)
        .set(\.textColor, .black)
        .set(\.text, "text_field_header_view".localized())

    private lazy var nameLabel = UILabel()
        .set(\.font, .inputPrimary)
        .set(\.textColor, .black)
        .set(\.text, "text_field_name_label".localized())

    private lazy var nameInput = UITextField()
        .set(\.font, .inputSecondary)
        .set(\.textColor, .black)
        .addLine(position: .bottom)

    private lazy var documentNumberLabel = UILabel()
        .set(\.font, .inputPrimary)
        .set(\.textColor, .black)
        .set(\.text, "text_field_document_number_label".localized())

    private lazy var documentNumberInput  = UITextField()
        .addLine(position: .bottom)
        .set(\.font, .inputSecondary)
        .set(\.textColor, .black)
        .set(\.autocorrectionType, .no)
        .set(\.keyboardType, .namePhonePad)
        .set(\.returnKeyType, .next)
        .set(\.clearButtonMode, .whileEditing)
        .set(\.delegate, self)

    private lazy var dateOfBirthLabel = UILabel()
        .set(\.font, .inputPrimary)
        .set(\.textColor, .black)
        .set(\.text, "text_field_date_of_birth".localized())

    private lazy var dateOfBirthInput = UIDatePicker()
        .set(\.backgroundColor, .white)
        .set(\.datePickerMode, .date)

    private lazy var mailLabel = UILabel()
        .set(\.font, .inputPrimary)
        .set(\.textColor, .black)
        .set(\.text, "text_field_mail".localized())

    private lazy var mailInput = UITextField()
        .set(\.font, .inputSecondary)
        .set(\.textColor, .black)
        .addLine(position: .bottom)

    private lazy var addressLabel = UILabel()
        .set(\.font, .inputPrimary)
        .set(\.textColor, .black)
        .set(\.text, "text_field_address".localized())

    private lazy var addressInput = UITextField()
        .set(\.font, .inputSecondary)
        .set(\.textColor, .black)
        .addLine(position: .bottom)

    private lazy var sexLabel = UILabel()
        .set(\.font, .inputPrimary)
        .set(\.textColor, .black)
        .set(\.text, "text_field_sex".localized())

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
    
    private lazy var telLabel = UILabel()
        .set(\.font, .inputPrimary)
        .set(\.textColor, .black)
        .set(\.text, "text_field_tel".localized())
     private lazy var telInput = UITextField()
        .set(\.font, .inputSecondary)
        .set(\.textColor, .black)
        .addLine(position: .bottom)
     private lazy var nationalityLabel = UILabel()
        .set(\.font, .inputPrimary)
        .set(\.textColor, .black)
        .set(\.text, "text_field_nationality".localized())
     private lazy var nationalityInput = UITextField()
        .set(\.font, .inputSecondary)
        .set(\.textColor, .black)
        .addLine(position: .bottom)

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
