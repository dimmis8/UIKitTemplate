// AddNewBirthdayView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol CancelButtonDelegate: AnyObject {
    func cancelView()
    func presentAlert(alert: UIAlertController)
}

/// Вью для добавления дня рожения
final class AddNewBirthdayView: UIView {
    
    // MARK: - Constants
    private let pickerAge = UIPickerView()
    private let pickerGender = UIPickerView()
    private let pickerDate = UIDatePicker()
    private let genders = ["male", "female"]

    // MARK: - Public Properties
    var name: String?
    weak var delegate: CancelButtonDelegate?

    // MARK: - Private Properties
    
    private var buttonCancel: UIButton {
        let button = UIButton(frame: CGRect(x: 20, y: 15, width: 80, height: 25))
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(cancelView), for: .touchUpInside)
        return button
    }

    private var buttonAdd: UIButton {
        let button = UIButton(frame: CGRect(x: 315, y: 15, width: 40, height: 25))
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(addBirthday), for: .touchUpInside)
        return button
    }

    private var buttonChangePhoto: UIButton {
        let button = UIButton(frame: CGRect(x: 125, y: 199, width: 125, height: 25))
        button.setTitle("Change photo", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        return button
    }

    private var labelName: UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: 239, width: 175, height: 20))
        label.text = "Name Surname"
        return label
    }

    private var labelBirthday: UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: 314, width: 175, height: 20))
        label.text = "Birthday"
        return label
    }

    private var labelAge: UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: 389, width: 175, height: 20))
        label.text = "Age"
        return label
    }

    private var labelGender: UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: 462, width: 175, height: 20))
        label.text = "Gender"
        return label
    }

    private var labelTelegram: UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: 537, width: 175, height: 20))
        label.text = "Telegram"
        return label
    }

    private var namePlaceholder: UITextField {
        let textField = UITextField(frame: CGRect(x: 20, y: 268, width: 250, height: 20))
        textField.placeholder = "Typing Name Surname"
        textField.textContentType = .name
        return textField
    }

    private var birthdayPlaceholder: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 343, width: 250, height: 20))
        textField.placeholder = "Typing Date of Birth"
        textField.textContentType = .name
        return textField
    }()

    private var agePlaceholder: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 418, width: 250, height: 20))
        textField.placeholder = "Typing age"
        textField.textContentType = .name
        return textField
    }()

    private var genderPlaceholder: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 491, width: 250, height: 20))
        textField.placeholder = "Indicate Gender"
        textField.textContentType = .name
        return textField
    }()

    private var telegramPlaceholder: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 566, width: 250, height: 20))
        textField.placeholder = "Typing Telegram"
        textField.textContentType = .name
        return textField
    }()

    private var personImage: UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 125, y: 66, width: 125, height: 125))
        imageView.image = UIImage(named: "emptyImage")
        return imageView
    }

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    private func setupAgePicker() {
        pickerAge.delegate = self
        pickerAge.dataSource = self
        agePlaceholder.inputView = pickerAge
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(
            title: "OK",
            style: .plain,
            target: self,
            action: #selector(doneButtonTapped)
        )
        toolbar.setItems([doneButton], animated: false)
        agePlaceholder.inputAccessoryView = toolbar
    }

    private func setupGenderPicker() {
        pickerGender.delegate = self
        pickerGender.dataSource = self
        genderPlaceholder.inputView = pickerGender
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(
            title: "OK",
            style: .plain,
            target: self,
            action: #selector(doneButtonTapped)
        )
        toolbar.setItems([doneButton], animated: false)
        genderPlaceholder.inputAccessoryView = toolbar
    }

    private func setupDataPicker() {
        pickerDate.preferredDatePickerStyle = .wheels
        pickerDate.datePickerMode = .date
        birthdayPlaceholder.inputView = pickerDate
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(
            title: "OK",
            style: .plain,
            target: self,
            action: #selector(doneButtonTappedForDate)
        )
        toolbar.setItems([doneButton], animated: false)
        birthdayPlaceholder.inputAccessoryView = toolbar
    }

    private func setupAlert() {
        let alert = UIAlertController(
            title: "Please enter Telegram",
            message: nil,
            preferredStyle: .alert
        )
        alert.addTextField { textFiled in
            textFiled.placeholder = "Typing Telegram"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default
        ) { [weak self] _ in
            guard let text = alert.textFields?.first?.text else { return }
            self?.telegramPlaceholder.text = text
        }
        alert.addAction(okAction)
        alert.preferredAction = okAction
        delegate?.presentAlert(alert: alert)
    }

    @objc private func cancelView() {
        delegate?.cancelView()
    }

    @objc private func addBirthday() {
        name = namePlaceholder.text
    }

    @objc private func doneButtonTapped() {
        genderPlaceholder.resignFirstResponder()
        agePlaceholder.resignFirstResponder()
    }

    @objc private func doneButtonTappedForDate() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.YYYY"
        birthdayPlaceholder.text = dateFormater.string(from: pickerDate.date)
        birthdayPlaceholder.resignFirstResponder()
    }

    private func lineForPlaceholder(yCoordinate: Int) -> UIView {
        let line = UIView(frame: CGRect(x: 20, y: yCoordinate, width: 335, height: 1))
        line.backgroundColor = UIColor(named: "lineGrayColor")
        return line
    }

    private func createView() {
        backgroundColor = .white
        addSubview(buttonCancel)
        addSubview(buttonAdd)
        addSubview(personImage)
        addSubview(buttonChangePhoto)
        addSubview(labelName)
        addSubview(labelBirthday)
        addSubview(labelAge)
        addSubview(labelGender)
        addSubview(labelTelegram)
        addSubview(namePlaceholder)
        addSubview(lineForPlaceholder(yCoordinate: 293))
        addSubview(birthdayPlaceholder)
        addSubview(lineForPlaceholder(yCoordinate: 368))
        addSubview(agePlaceholder)
        addSubview(lineForPlaceholder(yCoordinate: 443))
        addSubview(genderPlaceholder)
        addSubview(lineForPlaceholder(yCoordinate: 516))
        addSubview(telegramPlaceholder)
        addSubview(lineForPlaceholder(yCoordinate: 591))
        setupAgePicker()
        setupGenderPicker()
        setupDataPicker()
        telegramPlaceholder.delegate = self
    }
}

// MARK: - Extensions
/// Подписание на делегат передачи экшена редактирования текстового поля телегармма
extension AddNewBirthdayView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == telegramPlaceholder {
            setupAlert()
        }
    }
}

/// Подписание на делегат передачи экшена редактирования строк возраста и гендера
extension AddNewBirthdayView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case pickerAge:
            return String(row)
        case pickerGender:
            return genders[row]
        default: return ""
        }
    }
}

/// Подписание на делегат дата сорса пикера для его конфигурирования
extension AddNewBirthdayView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case pickerAge:
            return 150
        case pickerGender:
            return 2
        default: return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case pickerAge:
            agePlaceholder.text = "\(row)"
        case pickerGender:
            genderPlaceholder.text = genders[row]
        default: break
        }
    }
}
