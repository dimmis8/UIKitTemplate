// ProfileInfoView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Делегат отработки нажатия кнопки сохраннения информации
protocol SaveButtonDelegate: AnyObject {
    /// Функция сохранения информации
    func saveInfo()
}

/// Экран информации о профиле
class ProfileInfoView: UIView {
    // MARK: - Constants

    enum Constants {
        /// Текст для плейсхолдера имени
        static let nameTextFieldText = "Имя"
        /// Текст для плейсхолдера фамилии
        static let surnameTextFieldText = "Фамилия"
        /// Текст для плейсхолдера номера телефона
        static let numberTextFieldText = "Номер телефона"
        /// Текст для плейсхолдера размера ноги
        static let sizeTextFieldText = "Размер ноги"
        /// Текст для плейсхолдера даты рождения
        static let birthdayTextFieldText = "Дата рождения"
        /// Текст для плейсхолдера почты
        static let mailTextFieldText = "Почта"
        /// Отступ верхнего плейсходера от бара
        static let indentFromBarSize: CGFloat = 16
        /// Расстояние между верхними границами плейсхолдеров
        static let upperBoundariesPlaceholdersdistance: CGFloat = 54
        /// Текст кнопки для перехода на следующую клавиатуру с номерной клавиатуры
        static let doneButtonText = "Done"
        /// Текст для кнопки сохранения
        static let saveButtonText = "Сохранить"
        /// Формат даты для дата пикера
        static let dateFormat = "dd.MM.YYYY"
    }

    // MARK: - Private Properties

    var textFieldNumber = 0

    weak var delegate: SaveButtonDelegate?

    // MARK: - Visual Components

    private let pickerDate = UIDatePicker()

    private let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.saveButtonText, for: .normal)
        button.backgroundColor = .saveButton
        button.titleLabel?.font = .init(name: "Verdana-Bold", size: 16)
        button.layer.cornerRadius = 12
        button.layer.shadowColor = CGColor(gray: 0, alpha: 0.25)
        button.layer.shadowOpacity = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.isHidden = true
        return button
    }()

    private lazy var nameTextField = createTextField(withText: Constants.nameTextFieldText)
    private lazy var surnameTextField = createTextField(withText: Constants.surnameTextFieldText)
    private(set) lazy var numberTextField = createTextField(withText: Constants.numberTextFieldText)
    private lazy var sizeTextField = createTextField(withText: Constants.sizeTextFieldText)
    private lazy var birthdayTextField = createTextField(withText: Constants.birthdayTextFieldText)
    private(set) lazy var emailTextField = createTextField(withText: Constants.mailTextFieldText)

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        configureTextFields()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func makeButtonSaveVisible() {
        saveButton.isHidden = false
        saveButton.addTarget(self, action: #selector(saveInfo), for: .touchUpInside)
    }

    func hideSaveButton() {
        saveButton.isHidden = true
    }

    func setDelegateToTextFields(_ delegate: UITextFieldDelegate) {
        nameTextField.delegate = delegate
        surnameTextField.delegate = delegate
        numberTextField.delegate = delegate
        sizeTextField.delegate = delegate
        birthdayTextField.delegate = delegate
        emailTextField.delegate = delegate
    }

    func findOutAllFieldFilled() -> Bool {
        nameTextField.hasText && surnameTextField.hasText
            && numberTextField.hasText && sizeTextField.hasText
            && birthdayTextField.hasText && emailTextField.hasText
    }

    // MARK: - Private Methods

    private func loadView() {
        backgroundColor = .white
        addSubview(nameTextField)
        createConstraint(for: nameTextField)
        addSubview(surnameTextField)
        createConstraint(for: surnameTextField)
        addSubview(numberTextField)
        createConstraint(for: numberTextField)
        addSubview(sizeTextField)
        createConstraint(for: sizeTextField)
        addSubview(birthdayTextField)
        createConstraint(for: birthdayTextField)
        addSubview(emailTextField)
        createConstraint(for: emailTextField)
        addSubview(saveButton)
        createConstraintForSaveButton()
    }

    private func configureTextFields() {
        numberTextField.keyboardType = .numberPad
        emailTextField.keyboardType = .emailAddress
        sizeTextField.keyboardType = .numberPad
        setupDataPicker()
        addDoneButtonToKeyboard(textField: numberTextField, action: #selector(nextFirstResponderForNumberTextField))
        addDoneButtonToKeyboard(textField: sizeTextField, action: #selector(nextFirstResponderForNumberSizeField))
        addDoneButtonToKeyboard(
            textField: birthdayTextField,
            action: #selector(nextFirstResponderForNumberBirthdayField)
        )

        func addDoneButtonToKeyboard(textField: UITextField, action: Selector?) {
            let doneToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
            doneToolbar.barStyle = UIBarStyle.default
            let flexSpace = UIBarButtonItem(
                barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                target: nil,
                action: nil
            )
            let done = UIBarButtonItem(
                title: Constants.doneButtonText,
                style: UIBarButtonItem.Style.done,
                target: self,
                action: action
            )
            doneToolbar.items = [flexSpace, done]
            doneToolbar.sizeToFit()
            textField.inputAccessoryView = doneToolbar
        }

        func setupDataPicker() {
            pickerDate.preferredDatePickerStyle = .inline
            pickerDate.datePickerMode = .date
            birthdayTextField.inputView = pickerDate
        }
    }

    private func createTextField(withText text: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = text
        textField.layer.cornerRadius = 12
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        textField.backgroundColor = .textFieldBackground
        textField.tag = textFieldNumber
        return textField
    }

    private func createConstraint(for textField: UITextField) {
        textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        textField.topAnchor.constraint(
            equalTo: safeAreaLayoutGuide.topAnchor,
            constant: Constants.indentFromBarSize + Constants
                .upperBoundariesPlaceholdersdistance * CGFloat(textFieldNumber)
        ).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textFieldNumber += 1
    }

    private func createConstraintForSaveButton() {
        saveButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -34).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    @objc func nextFirstResponderForNumberTextField() {
        sizeTextField.becomeFirstResponder()
    }

    @objc func nextFirstResponderForNumberBirthdayField() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = Constants.dateFormat
        birthdayTextField.text = dateFormater.string(from: pickerDate.date)
        emailTextField.becomeFirstResponder()
    }

    @objc func nextFirstResponderForNumberSizeField() {
        birthdayTextField.becomeFirstResponder()
    }

    @objc func saveInfo() {
        delegate?.saveInfo()
    }
}
