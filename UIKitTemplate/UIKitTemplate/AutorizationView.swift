// AutorizationView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс вью экрана авторизации
final class AutorizationView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Логотип экрана авторизации
    private var logoApp: UIImageView {
        let logoApp = UIImageView(frame: CGRect(x: 125, y: 70, width: 125, height: 125))
        logoApp.image = UIImage(named: "logoApp")
        return logoApp
    }

    /// Лейбл "войти"
    private var signInLabel: UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: 266, width: 175, height: 31))
        label.text = "Sign in"
        label.textColor = UIColor(named: "fontRedColor")
        label.font = .boldSystemFont(ofSize: 26)
        return label
    }

    /// Лейбл "Email"
    private var emailLabel: UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: 318, width: 175, height: 19))
        label.text = "Email"
        label.textColor = UIColor(named: "fontRedColor")
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }

    /// Поле ввода для почты
    private var emailPlaceholder: UITextField {
        let textField = UITextField(frame: CGRect(x: 20, y: 347, width: 335, height: 20))
        textField.placeholder = " Typing email"
        textField.textContentType = .emailAddress
        return textField
    }

    /// Метод добавления элементов на вью
    private func createView() {
        addSubview(logoApp)
        addSubview(signInLabel)
        addSubview(emailLabel)
        addSubview(emailPlaceholder)
        
        
    }
}
