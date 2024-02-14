// SelectorCoffeView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол делегата экрана выбора кофе
protocol SelectorCoffeDelegate: AnyObject {
    /// Функция обработки нажатия кнопки "назад"
    func backButton()
    /// Функция обработки нажатия кнопки "поделиться"
    func shareButton()
    /// Функция обработки выбора сегмент контроллера с кофе
    /// - Parameters:
    ///   - state: номер состояния сегмент контроллера
    func segmentControllerChange(state: Int)
    /// Функция обработки нажатия кнопки выбора степени обжарки
    func roastButtonAction()
    /// Функция обработки нажатия кнопки выбора дополнений к кофе
    func aditivesButtonAction()
    /// Функция обработки нажатия кнопки "Заказать"
    func makeOrderButtonAction()
}

/// Вью экрана выбора кофе
final class SelectorCoffeView: UIView {
    // MARK: - Constants

    private enum Constants {
        /// Лейблы для кнопок селектора
        static let selectorLabels = ["Американо", "Капучино", "Латте"]
        /// Инициализированный текст лейбла цены
        static let initOfPriceLabelText = "Цѣна - 100 руб"
        /// Текст для лейбла модификации
        static let modificationTextLabel = "Модификация"
        /// Текст для кнопки выбора темной прожарки
        static let darkOfRoastButtonText = "Темная \nобжарка"
        /// Текст для кнопки выбора светлой прожарки
        static let lightRoastButtonText = "Свѣтлая \nобжарка"
        /// Текст кнопки "Заказать"
        static let makeOrderButtonLabel = "Заказать"
        /// Текст кнопки дополнительных элементов
        static let aditivesButtonLabel = "Дополнительные \nингредіенты"
    }

    // MARK: - Visual Components

    /// Кнопка возврата на предыдущий экран
    let leftNavBarButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.setImage(UIImage(named: "arrow"), for: .normal)
        button.backgroundColor = UIColor(named: "buttonBackColor")
        button.layer.cornerRadius = 22
        return button
    }()

    /// Кнопка шара промокда
    let rightNavBarButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        button.setImage(UIImage(named: "shareImage"), for: .normal)
        return button
    }()

    /// Лейбл с ценой
    var priceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 669, width: 345, height: 30))
        label.text = Constants.initOfPriceLabelText
        label.font = .init(name: "Verdana-Bold", size: 18)
        label.textAlignment = .right
        return label
    }()

    /// Сегмент контроллер выбора кофе
    private let coffeSegmentController = {
        let segmentController = UISegmentedControl(items: Constants.selectorLabels)
        var attribute = [NSAttributedString.Key.font: UIFont(name: "Verdana", size: 13.0)]
        UISegmentedControl.appearance().setTitleTextAttributes(
            attribute as [NSAttributedString.Key: Any],
            for: UIControl.State.normal
        )
        segmentController.selectedSegmentIndex = 0
        segmentController.frame = CGRect(x: 15, y: 368, width: 345, height: 44)
        segmentController.setDividerImage(
            UIImage(named: "segmentControllerColor"),
            forLeftSegmentState: .selected,
            rightSegmentState: .normal,
            barMetrics: .default
        )
        for subview in segmentController.subviews {
            subview.layer.shadowOpacity = 0
            subview.layer.shadowRadius = 0
        }
        return segmentController
    }()

    /// Надпись "Модификация"
    private let modificationLabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 432, width: 200, height: 30))
        label.text = Constants.modificationTextLabel
        label.font = .init(name: "Verdana-Bold", size: 18)
        return label
    }()

    /// Фон для изображения с кофе
    private let backgroundCoffe: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 346))
        view.image = UIImage(named: "backgroundCoffe")
        return view
    }()

    /// Кнопка "Заказать"
    private let makeOrderButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 717, width: 345, height: 53))
        button.setTitle(Constants.makeOrderButtonLabel, for: .normal)
        button.backgroundColor = UIColor(named: "orderButtonColor")
        button.titleLabel?.font = .init(name: "Verdana-Bold", size: 18)
        button.layer.cornerRadius = 12
        return button
    }()

    /// Вью с кофе
    private var coffeView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 112, y: 128, width: 150, height: 150))
        view.image = UIImage(named: "americano")
        return view
    }()

    /// Кнопка выбора обжарки кофе
    private lazy var roastSelectionButton = CustomUIButton().createButton(
        withImageName: "darkRost",
        labelText: Constants.darkOfRoastButtonText,
        position: CGPoint(x: 15, y: 482)
    )

    /// Кнопка дополнительных ингредиентов
    private lazy var aditivesButton = CustomUIButton().createButton(
        withImageName: "plusImage",
        labelText: Constants.aditivesButtonLabel,
        position: CGPoint(x: 195, y: 482)
    )

    // MARK: - Public Properties

    /// Ссылка на делегата
    weak var delegate: SelectorCoffeDelegate?

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

    /// Метод обновления вью в зависимости от выбранного кофе
    /// - Parameters:
    ///   - withState: выбранное состояние селект контроллера
    func reloadView(withState state: Int) {
        switch state {
        case 0:
            coffeView.image = UIImage(named: "americano")
        case 1:
            coffeView.image = UIImage(named: "cappuccino")
        case 2:
            coffeView.image = UIImage(named: "latte")
        default:
            break
        }
    }

    /// Метод обновления изображения кнопки выбора прожарки кофе
    /// - Parameters:
    ///   - withRoast: выбранная степень прожарки кофе
    func reloadRoastButton(withRoast roast: RoastOfCoffe) {
        roastSelectionButton.removeFromSuperview()
        switch roast {
        case .dark:
            roastSelectionButton = CustomUIButton().createButton(
                withImageName: "darkRost",
                labelText: Constants.darkOfRoastButtonText,
                position: CGPoint(x: 15, y: 482)
            )
        case .light:
            roastSelectionButton = CustomUIButton().createButton(
                withImageName: "lightRoast",
                labelText: Constants.lightRoastButtonText,
                position: CGPoint(x: 15, y: 482)
            )
        }
        addSubview(roastSelectionButton)
        setTergetsForUIControl()
    }

    /// Метод обновления изображения кнопки выбора прожарки кофе
    /// - Parameters:
    ///   - isAdditionChoosen: выбраны ли лобавки
    func reloadAdditives(isAdditionChoosen: Bool) {
        aditivesButton.removeFromSuperview()
        let imageName = isAdditionChoosen ? "checkMarkImage" : "plusImage"
        aditivesButton = CustomUIButton().createButton(
            withImageName: imageName,
            labelText: Constants.aditivesButtonLabel,
            position: CGPoint(x: 195, y: 482)
        )
        addSubview(aditivesButton)
        setTergetsForUIControl()
    }

    /// Метод обновления лейбла с ценой
    /// - Parameters:
    ///   - sum: сумма заказа
    func reloadPriceLabel(sum: Int) {
        priceLabel.removeFromSuperview()
        priceLabel.text = "Цѣна - \(sum) руб"
        addSubview(priceLabel)
    }

    // MARK: - Private Methods

    /// Метод создания вью
    private func createView() {
        backgroundColor = .white
        setTergetsForUIControl()
        addSubview(backgroundCoffe)
        addSubview(coffeView)
        addSubview(coffeSegmentController)
        addSubview(modificationLabel)
        addSubview(roastSelectionButton)
        addSubview(aditivesButton)
        addSubview(priceLabel)
        addSubview(makeOrderButton)
    }

    /// Метод установки таргетов для элементов UIControl
    private func setTergetsForUIControl() {
        leftNavBarButton.addTarget(self, action: #selector(leftNavBurButtonAction), for: .touchUpInside)
        rightNavBarButton.addTarget(self, action: #selector(rightNavBurButtonAction), for: .touchUpInside)
        coffeSegmentController.addTarget(
            self,
            action: #selector(actionForSelectorChangedState(state:)),
            for: .valueChanged
        )
        roastSelectionButton.addTarget(self, action: #selector(roastButtonAction), for: .touchUpInside)
        aditivesButton.addTarget(self, action: #selector(aditivesButtonAction), for: .touchUpInside)
        makeOrderButton.addTarget(self, action: #selector(makeOrderButtonAction), for: .touchUpInside)
    }

    /// Метод передачи таргета левой кнопки делегату
    @objc private func leftNavBurButtonAction() {
        delegate?.backButton()
    }

    /// Метод передачи таргета правой кнопки делегату
    @objc private func rightNavBurButtonAction() {
        delegate?.shareButton()
    }

    /// Метод передачи таргета сегмент контроллера делегату
    @objc private func actionForSelectorChangedState(state: UISegmentedControl) {
        delegate?.segmentControllerChange(state: state.selectedSegmentIndex)
    }

    /// Метод передачи таргета кнопки выбора прожарки делегату
    @objc private func roastButtonAction() {
        delegate?.roastButtonAction()
    }

    /// Метод передачи таргета кнопки выбора добавок
    @objc private func aditivesButtonAction() {
        delegate?.aditivesButtonAction()
    }

    /// Метод передачи таргета кнопки создания заказа
    @objc private func makeOrderButtonAction() {
        delegate?.makeOrderButtonAction()
    }
}
