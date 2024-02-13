// ChooseAdditivesView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол делегата экрана выбора добавок в кофе
protocol ChooseAdditivesDelegate: AnyObject {
    func closeView()
    func chooseAddition(addition: String, isAdd: Bool)
}

/// Вью экана выбора добавок в кофе
class ChooseAdditivesView: UIView {
    // MARK: - Public Properties

    /// Ссылка на делегата
    weak var delegate: ChooseAdditivesDelegate?

    // MARK: - Private Properties

    /// Надпись "Выберите дополнительные ингредиенты"
    private let chooseRoastLabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 53, width: 295, height: 44))
        label.text = "Выберите дополнительные \nингредiенты"
        label.font = .init(name: "Verdana-Bold", size: 18)
        label.textAlignment = .center
        label.numberOfLines = 2
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

    init(frame: CGRect, choosenAdditives: [String]) {
        super.init(frame: frame)
        createView()
        createViewWithAdditives(choosenAdditives: choosenAdditives)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    /// Метод установки таргетов для элементов UIControl
    private func setTergetsForUIControl() {
        closeViewButton.addTarget(self, action: #selector(closeViewButtonAction), for: .touchUpInside)
    }

    /// Метод создания вью
    private func createView() {
        backgroundColor = .white
        addSubview(chooseRoastLabel)
        addSubview(closeViewButton)
        setTergetsForUIControl()
    }

    /// Метод создания надписей со слайдерами
    /// - Parameters:
    ///   - choosenAdditives: массив добавок
    private func createViewWithAdditives(choosenAdditives: [String]) {
        /// Словарь с доступными добавками
        let additivies = CoffieAndAdditives().aditives.sorted(by: <)
        ///  Число оставшихся добавок для размещения на вью
        var numberOfAvalableAdditives = additivies.count
        for addition in additivies {
            /// Лейбл добавки
            let additionNameLabel: UILabel = {
                let label = UILabel(frame: CGRect(
                    x: 20,
                    y: 124 + CGFloat(additivies.count - numberOfAvalableAdditives) * 50,
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
            ///  Свитчер добавки
            let additionSwitch: UISwitch = {
                let switcher = UISwitch(frame: CGRect(
                    x: 301,
                    y: 124 + CGFloat(additivies.count - numberOfAvalableAdditives) * 50,
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

    /// Метод передачи таргета кнопки закрытия экрана делегату
    @objc private func closeViewButtonAction() {
        delegate?.closeView()
    }

    /// Метод передачи таргета свичей экрана делегату
    @objc private func choseAddition(switcher: UISwitch) {
        /// Массив имеющихся добавок
        let additives = CoffieAndAdditives().aditives.keys.sorted()
        delegate?.chooseAddition(addition: additives[switcher.tag], isAdd: switcher.isOn)
    }
}
