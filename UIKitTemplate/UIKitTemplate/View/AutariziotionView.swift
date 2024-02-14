// AutariziotionView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью для контроллера регистрации
final class AutariziotionView: UIView {
    // MARK: - Constants

    enum Constant {
        static let aufLabelText = "Авторизация"
        static let loginLabelText = "Логин"
        static let loginTextPlaysholder = "Введите почту"
        static let passwordLabelText = "Пароль"
        static let passwordTextPlaysholder = "Введите пароль"
        static let loginTextButton = "Войти"
    }

    // MARK: - Visual Components

    private let autariziotionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 26)
        label.frame = CGRect(x: 20, y: 32, width: 195, height: 31)
        label.text = Constant.aufLabelText
        return label
    }()

    private let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 84, width: 175, height: 19)
        label.text = Constant.loginLabelText
        return label
    }()

    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constant.loginTextPlaysholder
        textField.frame = CGRect(x: 20, y: 113, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    private let passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 159, width: 175, height: 19)
        label.text = Constant.passwordLabelText
        return label
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constant.passwordTextPlaysholder
        textField.frame = CGRect(x: 20, y: 188, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.isSecureTextEntry = true
        return textField
    }()

    lazy var secureTextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.frame = CGRect(x: 332, y: 185, width: 22, height: 22)
        button.tintColor = .gray
        return button
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constant.loginTextButton, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        /// Значение 255 обозначает максимально возможную интенсивность выбранного цвета в RGB-модели.
        button.backgroundColor = UIColor(red: 89.0 / 255.0, green: 190.0 / 255.0, blue: 199.0 / 255.0, alpha: 1)
        button.layer.cornerRadius = 12
        button.frame = CGRect(x: 20, y: 416, width: 335, height: 44)
        button.isEnabled = false
        return button
    }()

    private let lineOne = UIView()
    private let lineTwo = UIView()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Private Methods

    /// добавление элементов на вью
    private func setupView() {
        backgroundColor = .white
        addSubview(autariziotionLabel)
        addSubview(loginTitleLabel)
        addSubview(passwordTitleLabel)
        addSubview(lineOne)
        addSubview(lineTwo)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(secureTextButton)
        addSubview(loginButton)
        loginButton.alpha = 0.3
        lineOne.frame = CGRect(x: 20, y: 138, width: 335, height: 1)
        lineOne.backgroundColor = .systemGray4
        lineTwo.frame = CGRect(x: 20, y: 214, width: 335, height: 1)
        lineTwo.backgroundColor = .systemGray4
    }
}
