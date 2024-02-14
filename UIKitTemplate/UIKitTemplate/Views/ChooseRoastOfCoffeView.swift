// ChooseRoastOfCoffeView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол делегата экрана выбора прожарки кофе
protocol ChooseRoastDelegate: AnyObject {
    func darkRoastButtonAction()
    func lightRoastButtoAction()
    func closeView()
}

/// Вью экрана выбора прожарки кофе
class ChooseRoastOfCoffeView: UIView {
    // MARK: - Constants

    private enum Constants {
        /// Цвет обводки для выбранной обжарки
        static let borderColor = CGColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 1)
        /// Текст для кнопки темной прожарки
        static let darkRoastLabelText = "Темная \nобжарка"
        /// Текст для кнопки светлой прожарки
        static let lightRoastLabelText = "Свѣтлая \nобжарка"
        /// Текст для кнопки уточнения степени прожарки
        static let selectRoastLabelText = "Уточните обжарку зеренъ"
    }

    // MARK: - Public Properties

    /// Ссылка на делегата
    weak var delegate: ChooseRoastDelegate?
    /// Кнопка выбора темной обжарки кофе
    lazy var darkRoastButton = CustomUIButton().createButton(
        withImageName: "darkRost",
        labelText: Constants.darkRoastLabelText,
        position: CGPoint(x: 15, y: 102)
    )
    /// Кнопка выбора светолой обжарки кофе
    lazy var lightRoastButton = CustomUIButton().createButton(
        withImageName: "lightRoast",
        labelText: Constants.lightRoastLabelText,
        position: CGPoint(x: 195, y: 102)
    )

    // MARK: - Private Properties

    /// Надпись "Уточните прожарку зерен"
    private let chooseRoastLabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 53, width: 295, height: 30))
        label.text = Constants.selectRoastLabelText
        label.font = .init(name: "Verdana-Bold", size: 18)
        label.textAlignment = .center
        return label
    }()

    /// Кнопка закрытия вью
    private let closeViewButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 26, width: 14, height: 14))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()

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

    /// Метод создания вью
    private func createView() {
        backgroundColor = .white
        addSubview(chooseRoastLabel)
        addSubview(darkRoastButton)
        addSubview(lightRoastButton)
        addSubview(closeViewButton)
        setTergetsForUIControl()
    }

    /// Метод установки таргетов для элементов UIControl
    private func setTergetsForUIControl() {
        darkRoastButton.addTarget(self, action: #selector(darkRoastButtonAction), for: .touchUpInside)
        darkRoastButton.layer.borderColor = Constants.borderColor
        lightRoastButton.addTarget(self, action: #selector(lightRoastButtonAction), for: .touchUpInside)
        closeViewButton.addTarget(self, action: #selector(closeViewButtonAction), for: .touchUpInside)
    }

    /// Метод передачи таргета кнопки выбора темной обжарки делегату
    @objc private func darkRoastButtonAction() {
        delegate?.darkRoastButtonAction()
    }

    /// Метод передачи таргета кнопки выбора светлой обжарки делегату
    @objc private func lightRoastButtonAction() {
        delegate?.lightRoastButtoAction()
    }

    /// Метод передачи таргета кнопки закрытия экрана делегату
    @objc private func closeViewButtonAction() {
        delegate?.closeView()
    }
}
