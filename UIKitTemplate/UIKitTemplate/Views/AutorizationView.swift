// AutorizationView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol EnterButtonDelegate: AnyObject {
    func showNextView()
}

/// Класс вью экрана авторизации
final class AutorizationView: UIView {
    // MARK: - Public Properties

    weak var delegate: EnterButtonDelegate?

    // MARK: - Private Properties

    /// Логотип экрана авторизации
    private var logoApp: UIImageView {
        let logoApp = UIImageView(frame: CGRect(x: 125, y: 70, width: 125, height: 125))
        logoApp.image = UIImage(named: "logoApp")
        return logoApp
    }

    /// Лейбл названия приложения
    private var labelApp: UILabel {
        let label = UILabel(frame: CGRect(x: 100, y: 200, width: 175, height: 44))
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Birthday \nReminder"
        label.textColor = UIColor(named: "logoColor")
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }

    /// Лейбл "войти"
    private var signInLabel: UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: 266, width: 175, height: 31))
        label.text = "Sign in"
        label.textColor = UIColor(named: "fontRedColor")
        label.font = .boldSystemFont(ofSize: 26)
        return label
    }

    /// Иконка скрытия пароля
    private var imageToMakePasswordVisable: UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 332, y: 425, width: 22, height: 19))
        imageView.image = UIImage(systemName: "eye.slash")
        imageView.tintColor = .gray
        return imageView
    }

    /// Вью с кнопкой входить по фейс айди
    private var faceIDView = UIView(frame: CGRect(x: 86, y: 544, width: 216, height: 35))

    /// Лейбл включения фейс айди
    private var faceAIDLabel: UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        label.text = "Use FaceID"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }

    /// Переключатель использования FaceID
    private var faceIDSwitch: UISwitch {
        UISwitch(frame: CGRect(x: 162, y: 0, width: 54, height: 35))
    }

    /// Обертка плейсхолдера для ввода емейла
    private lazy var emailPlaceholderWrapper = createPlaceholderWrapper(withText: "Email", yCoordinate: 318)

    /// Плейсхолдер ввода емейла
    private lazy var emailPlaceholder = createPlaceholder(
        placeholderText: "Typing email",
        isSecure: false,
        yCoordinate: 318
    )

    /// Обертка плейсхолдера для ввода пароля
    private lazy var passwordPlaceholderWrapper = createPlaceholderWrapper(withText: "Password", yCoordinate: 393)

    /// Плейсхолдер ввода пароля
    private lazy var passwordPlaceholder = createPlaceholder(
        placeholderText: "Typing password",
        isSecure: true,
        yCoordinate: 393
    )

    /// Кнопка "Войти"
    private var enterButton = UIButton(frame: CGRect(x: 20, y: 671, width: 335, height: 44))

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

    /// Метод создания обертки поля ввода
    /// - Parameters:
    ///     - withText: Марка имени плейсхолдера
    ///     - yCoordinate: y-координата плейсхолдера
    /// - Returns: Вью обертки плейсхолдера
    private func createPlaceholderWrapper(withText text: String, yCoordinate: Int) -> UIView {
        var label: UILabel {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 175, height: 19))
            label.text = text
            label.textColor = UIColor(named: "fontRedColor")
            label.font = .boldSystemFont(ofSize: 16)
            return label
        }
        var lineForPlaceholder: UIView {
            let line = UIView(frame: CGRect(x: 0, y: 55, width: 335, height: 1))
            line.backgroundColor = UIColor(named: "lineGrayColor")
            return line
        }
        let placeholderView = UIView(frame: CGRect(x: 20, y: yCoordinate, width: 335, height: 56))
        placeholderView.addSubview(label)
        placeholderView.addSubview(lineForPlaceholder)
        return placeholderView
    }

    /// Метод создания поля ввода
    /// - Parameters:
    ///     - placeholderText: Текст внутри плейсхолдера
    ///     - yCoordinate: y-координата плейсхолдера
    ///     - isSecure: установка плейсхолдера секьюрным
    /// - Returns: Плейсхолдер
    private func createPlaceholder(placeholderText: String, isSecure: Bool, yCoordinate: Int) -> UITextField {
        var placeholder: UITextField {
            let textField = UITextField(frame: CGRect(x: 20, y: yCoordinate + 30, width: 335, height: 20))
            textField.placeholder = placeholderText
            textField.textContentType = .emailAddress
            textField.isSecureTextEntry = isSecure
            return textField
        }
        return placeholder
    }

    /// Метод настройки кнопки
    private func setupEnterButton() {
        enterButton.setTitle("Login", for: .normal)
        enterButton.backgroundColor = UIColor(named: "buttonLightColor")
        enterButton.layer.cornerRadius = 12
        enterButton.isEnabled = false
        enterButton.addTarget(self, action: #selector(showNextView), for: .touchUpInside)
    }

    /// Метод вызова функции перехода на следующую страницу у делегата
    @objc private func nextView() {
        delegate?.showNextView()
    }

    /// Метод добавления элементов на вью
    private func createView() {
        addSubview(logoApp)
        addSubview(labelApp)
        addSubview(signInLabel)
        addSubview(emailPlaceholderWrapper)
        addSubview(emailPlaceholder)
        addSubview(passwordPlaceholderWrapper)
        addSubview(passwordPlaceholder)
        addSubview(imageToMakePasswordVisable)
        emailPlaceholder.delegate = self
        passwordPlaceholder.delegate = self
        addSubview(enterButton)
        setupEnterButton()
        faceIDView.addSubview(faceAIDLabel)
        faceIDView.addSubview(faceIDSwitch)
        addSubview(faceIDView)
        faceIDView.isHidden = true
    }
}

// MARK: - UITextFieldDelegate

extension AutorizationView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let emailText = emailPlaceholder.text, let passwordText = passwordPlaceholder.text else { return }
        if !emailText.isEmpty, !passwordText.isEmpty {
            enterButton.isEnabled = true
            enterButton.backgroundColor = UIColor(named: "fontRedColor")
            faceIDView.isHidden = false
        } else {
            enterButton.isEnabled = false
            faceIDView.isHidden = true
            enterButton.backgroundColor = UIColor(named: "buttonLightColor")
        }
    }
}
