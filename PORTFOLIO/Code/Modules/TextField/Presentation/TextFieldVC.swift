//
//  TextFieldVC.swift
//  PORTFOLIO
//
//  Created by Andres Felipe Alzate Restrepo on 19/06/2020.
//  Copyright © 2020 aalzres. All rights reserved.
//

import UIKit
import UserInterface
import Architecture

class TextFieldVC: BaseKeyboardViewController {
    override var contentSticky: CGFloat { saveContentButton.height }
    override var titleView: String { "main_screen_text_field".localized() }

    private lazy var contentStackView = UIStackView()
        .set(\.axis, .vertical)
        .set(\.spacing, .paddingS)
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

    private lazy var saveContentButton = UIView()

    private lazy var saveButton = CButton()
        .set(\.text, "Save")

    override func addAllSubviews() {
        super.addAllSubviews()
        view.addSubview(saveContentButton)
        saveContentButton.addSubview(saveButton)
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubviews([
            headerView,
            nameLabel,
            nameInput,
            documentNumberLabel,
            documentNumberInput,
            dateOfBirthLabel,
            dateOfBirthInput,
            mailLabel,
            mailInput,
            addressLabel,
            addressInput,
            sexLabel,
            sexInput,
            telLabel,
            telInput,
            nationalityLabel,
            nationalityInput
        ])
    }

    override func addAllConstraints() {
        super.addAllConstraints()
        scrollView.snp.remakeConstraints {
            $0.top.horizontal.equalTo(safeArea)
        }
        contentStackView.snp.makeConstraints {
            $0.edges.width.equalToSuperview().inset(.paddingS)
        }
        saveContentButton.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.horizontal.equalToSuperview()
            $0.bottom.equalTo(safeArea)
        }
        saveButton.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(.paddingS)
        }
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
