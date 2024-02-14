// ChooseAdditivesView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол делегата экрана выбора добавок в кофе
protocol ChooseAdditivesDelegate: AnyObject {
    /// Функция обработки нажатия кнопки закрытия экрана
    func closeView()
    /// Функция обработки выбора добавок
    /// - Parameters:
    ///   - addition: выбранная добавка
    ///   - isAdd: состояние добавленности
    func chooseAddition(addition: String, isAdd: Bool)
}

/// Экран выбора добавок в кофе
final class ChooseAdditivesView: UIView {
    // MARK: - Constants

    private enum Constants {
        /// Расстояние между двумя добавками
        static let distanceBetweenAdditives: CGFloat = 50
        /// Текст для лейбла выбора дополнительных элементов
        static let chooseRoastLabelText = "Выберите дополнительные \nингредiенты"
    }

    // MARK: - Visual Components

    private let chooseRoastLabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 53, width: 295, height: 44))
        label.text = Constants.chooseRoastLabelText
        label.font = .init(name: "Verdana-Bold", size: 18)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    private lazy var closeViewButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 26, width: 14, height: 14))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(closeViewButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Public Properties

    weak var delegate: ChooseAdditivesDelegate?

    // MARK: - Initializers

    init(frame: CGRect, choosenAdditives: [String]) {
        super.init(frame: frame)
        createView()
        createViewWithAdditives(choosenAdditives: choosenAdditives)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createView()
    }

    // MARK: - Private Methods

    private func createView() {
        backgroundColor = .white
        addSubview(chooseRoastLabel)
        addSubview(closeViewButton)
    }

    private func createViewWithAdditives(choosenAdditives: [String]) {
        // Словарь с доступными добавками
        let additivies = CoffieAndAdditives().aditives.sorted(by: <)
        //  Число оставшихся добавок для размещения на вью
        var numberOfAvalableAdditives = additivies.count
        for addition in additivies {
            // Лейбл добавки
            let additionNameLabel: UILabel = {
                let label = UILabel(frame: CGRect(
                    x: 20,
                    y: 124 + CGFloat(additivies.count - numberOfAvalableAdditives) * Constants.distanceBetweenAdditives,
                    width: 275,
                    height: 35
                ))
                let attributedString = NSMutableAttributedString(
                    string: "\(addition.key)",
                    attributes: [NSAttributedString.Key.font: UIFont(name: "Verdana", size: 16) ?? UIFont()]
                )
                let greenText = NSMutableAttributedString(
                    string: "  +\(addition.value) руб",
                    attributes: [
                        NSAttributedString.Key.foregroundColor: UIColor.systemGreen,
                        NSAttributedString.Key.font: UIFont(name: "Verdana", size: 16) ?? UIFont()
                    ]
                )
                attributedString.append(greenText)
                label.attributedText = attributedString
                return label
            }()
            //  Свитчер добавки
            let additionSwitch: UISwitch = {
                let switcher = UISwitch(frame: CGRect(
                    x: 301,
                    y: 124 + CGFloat(additivies.count - numberOfAvalableAdditives) * Constants.distanceBetweenAdditives,
                    width: 54,
                    height: 35
                ))
                switcher.tag = additivies.count - numberOfAvalableAdditives
                if (choosenAdditives.contains { $0 == addition.key }) {
                    switcher.isOn = true
                }
                switcher.addTarget(self, action: #selector(choseAddition(switcher:)), for: .valueChanged)
                return switcher
            }()
            numberOfAvalableAdditives -= 1
            addSubview(additionNameLabel)
            addSubview(additionSwitch)
        }
    }

    @objc private func closeViewButtonAction() {
        delegate?.closeView()
    }

    @objc private func choseAddition(switcher: UISwitch) {
        let additives = CoffieAndAdditives().aditives.keys.sorted()
        delegate?.chooseAddition(addition: additives[switcher.tag], isAdd: switcher.isOn)
    }
}
