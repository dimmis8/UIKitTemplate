// ChooseRoastOfCoffeView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол делегата экрана выбора прожарки кофе
protocol ChooseRoastDelegate: AnyObject {
    /// Функция обработки нажатия кнопки темной прожарки кофе
    func darkRoastButtonAction()
    /// Функция обработки нажатия кнопки светлой прожарки кофе
    func lightRoastButtoAction()
    /// Функция обработки нажатия кнопки закрытия экрана
    func closeView()
}

/// Экран выбора прожарки кофе
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

    // MARK: - Visual Components

    lazy var darkRoastButton = ButtonForSelectors().createButton(
        withImageName: "darkRost",
        labelText: Constants.darkRoastLabelText,
        position: CGPoint(x: 15, y: 102)
    )
    lazy var lightRoastButton = ButtonForSelectors().createButton(
        withImageName: "lightRoast",
        labelText: Constants.lightRoastLabelText,
        position: CGPoint(x: 195, y: 102)
    )

    private let chooseRoastLabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 53, width: 295, height: 30))
        label.text = Constants.selectRoastLabelText
        label.font = .init(name: "Verdana-Bold", size: 18)
        label.textAlignment = .center
        return label
    }()

    private let closeViewButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 26, width: 14, height: 14))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()

    // MARK: - Public Properties

    weak var delegate: ChooseRoastDelegate?

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

    private func createView() {
        backgroundColor = .white
        addSubview(chooseRoastLabel)
        addSubview(darkRoastButton)
        addSubview(lightRoastButton)
        addSubview(closeViewButton)
        setTergetsForUIControl()
    }

    private func setTergetsForUIControl() {
        darkRoastButton.addTarget(self, action: #selector(darkRoastButtonAction), for: .touchUpInside)
        darkRoastButton.layer.borderColor = Constants.borderColor
        lightRoastButton.addTarget(self, action: #selector(lightRoastButtonAction), for: .touchUpInside)
        closeViewButton.addTarget(self, action: #selector(closeViewButtonAction), for: .touchUpInside)
    }

    @objc private func darkRoastButtonAction() {
        delegate?.darkRoastButtonAction()
    }

    @objc private func lightRoastButtonAction() {
        delegate?.lightRoastButtoAction()
    }

    @objc private func closeViewButtonAction() {
        delegate?.closeView()
    }
}
