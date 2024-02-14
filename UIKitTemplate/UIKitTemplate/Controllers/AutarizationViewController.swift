// AutarizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit


/// Экран для авторизации пользователя
final class AutarizationViewController: UIViewController {
    // MARK: - Constants

    enum Constant {
        static let nameCafeLabelText = "Кофеиновъ"
        static let eyeElashImage = "eye.slash"
        static let eyeImage = "eye"
    }

    // MARK: - Visual Components

    private let startView = AutariziotionView()
    private let nameImageview = UIImageView()
    private let nameCafeLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.nameCafeLabelText
        label.frame = CGRect(x: 100, y: 103, width: 175, height: 76)
        label.font = UIFont(name: "AmaticSC-Bold", size: 55)
        /// Значение 255 обозначает максимально возможную интенсивность выбранного цвета в RGB-модели.
        label.textColor = UIColor(red: 207 / 255.0, green: 180 / 255.0, blue: 150 / 255.0, alpha: 1)
        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addTargetForButton()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.addSubview(startView)
        view.addSubview(nameCafeLabel)
        startView.frame = CGRect(x: 0, y: 248, width: 375, height: 564)
        startView.layer.cornerRadius = 20
    }

    private func addTargetForButton() {
        startView.passwordTextField.delegate = self
        startView.loginButton.addTarget(self, action: #selector(loginComform), for: .touchUpInside)
        startView.secureTextButton.addTarget(self, action: #selector(secureText), for: .touchUpInside)
    }

    @objc private func loginComform() {
        let menuViewController = MenuViewController()
        let navigtionVC = UINavigationController(rootViewController: menuViewController)
        navigtionVC.modalPresentationStyle = .fullScreen
        present(navigtionVC, animated: true, completion: nil)
    }

    @objc private func secureText() {
        startView.passwordTextField.isSecureTextEntry.toggle()
        let nameImage = startView.passwordTextField.isSecureTextEntry ? Constant.eyeElashImage : Constant.eyeImage
        startView.secureTextButton.setImage(UIImage(systemName: nameImage), for: .normal)
    }
}

// MARK: - Extension

/// проверка логина и пароля на валидность
extension AutarizationViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let loginText = startView.loginTextField.text ?? ""
        let passwordText = startView.passwordTextField.text ?? ""
        if !loginText.isEmpty, !passwordText.isEmpty {
            startView.loginButton.alpha = 1
            startView.loginButton.isEnabled = true
        }
        return true
    }
}
