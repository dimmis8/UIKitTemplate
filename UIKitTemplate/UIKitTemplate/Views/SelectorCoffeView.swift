// SelectorCoffeView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол делегата экрана выбора кофе
protocol SelectorCoffeDelegate: AnyObject {
    func backButton()
    func shareButton()
    func segmentControllerChange(state: Int)
    func roastButtonAction()
    func aditivesButtonAction()
    func makeOrderButtonAction()
}

/// Вью экрана выбора кофе
final class SelectorCoffeView: UIView {
    // MARK: - Public Properties

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

    /// Ссылка на делегата
    weak var delegate: SelectorCoffeDelegate?

    /// Лейбл с ценой
    var priceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 669, width: 345, height: 30))
        label.text = "Цѣна - 100 руб"
        label.font = .init(name: "Verdana-Bold", size: 18)
        label.textAlignment = .right
        return label
    }()

    // MARK: - Private Properties

    /// Сегмент контроллер выбора кофе
    private let coffeSegmentController = {
        let segmentController = UISegmentedControl(items: ["Американо", "Капучино", "Латте"])
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
        label.text = "Модификация"
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
        button.setTitle("Заказать", for: .normal)
        button.backgroundColor = UIColor(named: "orderButtonColor")
        button.titleLabel?.font = .init(name: "Verdana-Bold", size: 18)
        button.layer.cornerRadius = 12
        return button
    }()

    /// Кнопка выбора обжарки кофе
    private lazy var roastSelectionButton: UIButton = createButton(
        withImageName: "darkRost",
        labelText: "Темная \nобжарка",
        position: CGPoint(x: 15, y: 482)
    )

    /// Кнопка дополнительных ингредиентов
    private lazy var aditivesButton: UIButton = createButton(
        withImageName: "plusImage",
        labelText: "Дополнительные \nингредіенты",
        position: CGPoint(x: 195, y: 482)
    )

    /// Вью с кофе
    private var coffeView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 112, y: 128, width: 150, height: 150))
        view.image = UIImage(named: "americano")
        return view
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
            roastSelectionButton = createButton(
                withImageName: "darkRost",
                labelText: "Темная \nобжарка",
                position: CGPoint(x: 15, y: 482)
            )
        case .light:
            roastSelectionButton = createButton(
                withImageName: "lightRoast",
                labelText: "Свѣтлая \nобжарка",
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
        aditivesButton = createButton(
            withImageName: imageName,
            labelText: "Дополнительные \nингредіенты",
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
        button.backgroundColor = UIColor(named: "backgroundButtonColor")
        return button
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
