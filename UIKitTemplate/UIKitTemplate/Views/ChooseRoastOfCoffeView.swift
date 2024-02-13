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

    private enum Color {
        /// Цвет обводки для выбранной обжарки
        static let borderColor = CGColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 1)
    }

    // MARK: - Public Properties

    /// Ссылка на делегата
    weak var delegate: ChooseRoastDelegate?
    /// Кнопка выбора темной обжарки кофе
    lazy var darkRoastButton: UIButton = createButton(
        withImageName: "darkRost",
        labelText: "Темная \nобжарка",
        position: CGPoint(x: 15, y: 102)
    )
    /// Кнопка выбора светолой обжарки кофе
    lazy var lightRoastButton: UIButton = createButton(
        withImageName: "lightRoast",
        labelText: "Свѣтлая \nобжарка",
        position: CGPoint(x: 195, y: 102)
    )

    // MARK: - Private Properties

    /// Надпись "Уточните прожарку зерен"
    private let chooseRoastLabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 53, width: 295, height: 30))
        label.text = "Уточните обжарку зеренъ"
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

    // MARK: - Public Methods

    /// Метод для создания новой кнопки со своим изображением, лейблом и позицией
    /// - Parameters:
    ///   - withImageName: имя изображения для кнопки
    ///   - labelText: текст лейбла кнопки
    ///   - position: позиция размещения кнопки
    /// - Returns: Кнопка
    func createButton(withImageName imageName: String, labelText: String, position: CGPoint) -> UIButton {
        let button = UIButton(frame: CGRect(origin: position, size: CGSize(width: 165, height: 165)))
        let imageView = {
            let imageView = UIImageView(frame: CGRect(x: 31, y: 17, width: 100, height: 100))
            imageView.image = UIImage(named: imageName)
            return imageView
        }()
        let labelView = {
            let labelView = UILabel(frame: CGRect(x: 0, y: 117, width: 165, height: 34))
            labelView.text = labelText
            labelView.textAlignment = .center
            labelView.numberOfLines = 2
            labelView.textColor = .black
            labelView.font = .init(name: "Verdana", size: 13)
            return labelView
        }()
        button.addSubview(imageView)
        button.addSubview(labelView)
        button.layer.cornerRadius = 12
        button.layer.borderColor = CGColor(gray: 0, alpha: 0)
        button.backgroundColor = UIColor(named: "backgroundButtonColor")
        button.layer.borderWidth = 1
        return button
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
        darkRoastButton.layer.borderColor = Color.borderColor
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
