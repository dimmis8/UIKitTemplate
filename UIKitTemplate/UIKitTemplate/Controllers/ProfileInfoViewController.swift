// ProfileInfoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран информации о профиле
class ProfileInfoViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        /// Текст для названия вкладки вью
        static let viewTitleName = "Мои данные"
        /// Максимальное количество цифр номера телефона
        static let maxNumberCount = 11
        /// Минимальное количество цифр номера телефона
        static let minNumberCount = 7
        /// Патерн для минимального количества цифр
        static let paternForMin = "(\\d)(\\d{3})(\\d+)"
        /// Патерн для максимального количества цифр
        static let paternForMax = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
        /// Шаблон для размещения символов при минимальном количестве цифр
        static let maskForMin = "$1 ($2) $3"
        /// Шаблон для размещения символов при максимальном количестве цифр
        static let maskForMax = "$1 ($2) $3-$4-$5"
        /// Патерн для регикса номера телефона
        static let paternForNumber = "[\\+\\s-\\(\\)]"
        /// Патерн для регикса номера телефона
        static let paternForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        /// Формат для предикейта емейла
        static let formatEmail = "SELF MATCHES %@"
        /// Сообщение "Не все поля заполнены"
        static let alertNoAllDataText = "Не все поля заполнены"
        /// Сообщение "Почта введена неверно"
        static let alertEmailErrorText = "Почта введена неверно"
        /// Сообщение "Номер введен неверно"
        static let alertPhoneErrorText = "Номер введен неверно"
        /// Сообщение "Не сохранено"
        static let alertText = "Не сохранено"
        /// Кнопка алерта "OK"
        static let alertOkButtonText = "OK"
        /// Количество символов при полном заполненном номере
        static let phoneCharactersNumber = 18
    }

    // MARK: - Private Properties

    private let regix = try? NSRegularExpression(pattern: Constants.paternForNumber, options: .caseInsensitive)

    private lazy var profileInfoView = ProfileInfoView()

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = profileInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
    }

    // MARK: - Private Methods

    private func configureController() {
        title = Constants.viewTitleName
        navigationController?.navigationBar.tintColor = .black
        profileInfoView.delegate = self
        profileInfoView.setDelegateToTextFields(self)

        view.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(UIInputViewController.dismissKeyboard)
        ))

        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = -20
        }
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = 0
        }
    }

    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+" }
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        guard var number = regix?
            .stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "") else { return "" }
        if (number.count) > Constants.maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: Constants.maxNumberCount)
            number = String(number[number.startIndex ..< maxIndex])
        }
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex ..< maxIndex])
        }
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex ..< maxIndex
        if number.count < Constants.minNumberCount {
            number = number.replacingOccurrences(
                of: Constants.paternForMin,
                with: Constants.maskForMin,
                options: .regularExpression,
                range: regRange
            )
        } else {
            number = number.replacingOccurrences(
                of: Constants.paternForMax,
                with: Constants.maskForMax,
                options: .regularExpression,
                range: regRange
            )
        }
        return "+\(number)"
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

/// Подписание на делегат текстовых полей
extension ProfileInfoViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        profileInfoView.makeButtonSaveVisible()
        guard textField == profileInfoView.numberTextField else { return true }
        let fullString = (textField.text ?? "") + string
        textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
        return false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == (profileInfoView.textFieldNumber - 1) {
            textField.resignFirstResponder()
        } else {
            let nextResponder = textField.superview?.viewWithTag(textField.tag + 1)
            nextResponder?.becomeFirstResponder()
        }
        return true
    }
}

extension ProfileInfoViewController: SaveButtonDelegate {
    func saveInfo() {
        guard profileInfoView.findOutAllFieldFilled() else {
            createAlert(withText: Constants.alertNoAllDataText)
            return
        }
        guard determiningValidityMail() else {
            createAlert(withText: Constants.alertEmailErrorText)
            return
        }
        guard profileInfoView.numberTextField.text?.count ?? 0 == Constants.phoneCharactersNumber else {
            createAlert(withText: Constants.alertPhoneErrorText)
            return
        }
        profileInfoView.hideSaveButton()
    }

    private func determiningValidityMail() -> Bool {
        let emailPredicate = NSPredicate(format: Constants.formatEmail, Constants.paternForEmail)
        return emailPredicate.evaluate(with: profileInfoView.emailTextField.text)
    }

    private func createAlert(withText text: String) {
        let alertController = UIAlertController(title: Constants.alertText, message: text, preferredStyle: .alert)
        let closeButton = UIAlertAction(title: Constants.alertOkButtonText, style: .cancel)
        alertController.addAction(closeButton)
        present(alertController, animated: true)
    }
}
