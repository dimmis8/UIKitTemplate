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
        /// Словарь состояний селектора и изображений для каждого состояния
        static let existedCoffeMap = [0: "americano", 1: "cappuccino", 2: "latte"]
        /// Название изображения кофе темной прожарки
        static let darkRoastImageName = "darkRost"
        /// Название изображения кофе светлой прожарки
        static let lightRoastImageName = "lightRoast"
        /// Название изображения плюса
        static let plusImageName = "plusImage"
        /// Название изображения галочки
        static let checkMarkImageName = "checkMarkImage"
    }

    // MARK: - Visual Components

    let leftNavBarButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.setImage(.arrow, for: .normal)
        button.backgroundColor = .buttonBack
        button.layer.cornerRadius = 22
        return button
    }()

    let rightNavBarButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        button.setImage(.share, for: .normal)
        return button
    }()

    var priceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 669, width: 345, height: 30))
        label.text = Constants.initOfPriceLabelText
        label.font = .init(name: "Verdana-Bold", size: 18)
        label.textAlignment = .right
        return label
    }()

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
            .segmentController,
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

    private let modificationLabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 432, width: 200, height: 30))
        label.text = Constants.modificationTextLabel
        label.font = .init(name: "Verdana-Bold", size: 18)
        return label
    }()

    private let backgroundCoffe: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 346))
        view.image = .backgroundCoffe
        return view
    }()

    private let makeOrderButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 717, width: 345, height: 53))
        button.setTitle(Constants.makeOrderButtonLabel, for: .normal)
        button.backgroundColor = .orderButton
        button.titleLabel?.font = .init(name: "Verdana-Bold", size: 18)
        button.layer.cornerRadius = 12
        return button
    }()

    private var coffeImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 112, y: 128, width: 150, height: 150))
        view.image = .americano
        return view
    }()

    private lazy var roastSelectionButton = ButtonForSelectors().createButton(
        withImageName: Constants.darkRoastImageName,
        labelText: Constants.darkOfRoastButtonText,
        position: CGPoint(x: 15, y: 482)
    )

    private lazy var aditivesButton = ButtonForSelectors().createButton(
        withImageName: Constants.plusImageName,
        labelText: Constants.aditivesButtonLabel,
        position: CGPoint(x: 195, y: 482)
    )

    // MARK: - Public Properties

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

    func reloadView(withState stateIndex: Int) {
        coffeImageView.image = UIImage(named: Constants.existedCoffeMap[stateIndex] ?? "")
    }

    func reloadRoastButton(withRoast roast: RoastOfCoffe) {
        roastSelectionButton.removeFromSuperview()
        switch roast {
        case .dark:
            roastSelectionButton = ButtonForSelectors().createButton(
                withImageName: Constants.darkRoastImageName,
                labelText: Constants.darkOfRoastButtonText,
                position: CGPoint(x: 15, y: 482)
            )
        case .light:
            roastSelectionButton = ButtonForSelectors().createButton(
                withImageName: Constants.lightRoastImageName,
                labelText: Constants.lightRoastButtonText,
                position: CGPoint(x: 15, y: 482)
            )
        }
        addSubview(roastSelectionButton)
        setTergetsForUIControl()
    }

    func reloadAdditives(isAdditionChoosen: Bool) {
        aditivesButton.removeFromSuperview()
        let imageName = isAdditionChoosen ? Constants.checkMarkImageName : Constants.plusImageName
        aditivesButton = ButtonForSelectors().createButton(
            withImageName: imageName,
            labelText: Constants.aditivesButtonLabel,
            position: CGPoint(x: 195, y: 482)
        )
        addSubview(aditivesButton)
        setTergetsForUIControl()
    }

    func reloadPriceLabel(sum: Int) {
        priceLabel.text = "Цѣна - \(sum) руб"
    }

    // MARK: - Private Methods

    private func createView() {
        backgroundColor = .white
        setTergetsForUIControl()
        addSubview(backgroundCoffe)
        addSubview(coffeImageView)
        addSubview(coffeSegmentController)
        addSubview(modificationLabel)
        addSubview(roastSelectionButton)
        addSubview(aditivesButton)
        addSubview(priceLabel)
        addSubview(makeOrderButton)
    }

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

    @objc private func leftNavBurButtonAction() {
        delegate?.backButton()
    }

    @objc private func rightNavBurButtonAction() {
        delegate?.shareButton()
    }

    @objc private func actionForSelectorChangedState(state: UISegmentedControl) {
        delegate?.segmentControllerChange(state: state.selectedSegmentIndex)
    }

    @objc private func roastButtonAction() {
        delegate?.roastButtonAction()
    }

    @objc private func aditivesButtonAction() {
        delegate?.aditivesButtonAction()
    }

    @objc private func makeOrderButtonAction() {
        delegate?.makeOrderButtonAction()
    }
}
