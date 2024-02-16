// ShopingCartView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Делегат изменения количества товаров в корзине
protocol CountOfItemDelegate: AnyObject {
    /// Функция изменения количества товаров в корзине
    func changeItemCount(ofItem: StoreItem, count: Int)
    /// Функция изменения размера товара в корзине
    func changeItemSize(forItem item: StoreItem, newSize: Int)
}

/// Экран корзины
class ShopingCartView: UIView {
    // MARK: - Constants

    enum Constants {
        /// Текст лейбла количества товаров
        static let numberLabelText = "Количество"
        /// Символ для кнопки уменьшения количества товаров
        static let minusChar = "-"
        /// Символ для кнопки увеличения количества товаров
        static let plusChar = "+"
        /// Текст лейбла размера
        static let sizeLabelText = "Размер"
        /// Минимальный размер обуви
        static let minSize = 35
        /// Максимальный размер обуви
        static let maxSize = 39
        /// Количество кнопок с размерами в строке
        static let sizeButtonInLineCount = 4
        /// Текст лейбла цены
        static let costLabelText = "Цена"
        /// Цвет мадженты
        static let magentaColor = CGColor(red: 225 / 255, green: 24 / 255, blue: 131 / 255, alpha: 1)
    }

    // MARK: - Visual Components

    private lazy var makeOrderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .saveButton
        button.titleLabel?.font = .init(name: "Verdana-Bold", size: 16)
        button.layer.cornerRadius = 12
        button.layer.shadowColor = CGColor(gray: 0, alpha: 0.25)
        button.layer.shadowOpacity = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        return button
    }()

    // MARK: - Public Properties

    private var sumOfCart = 0

    weak var delegate: CountOfItemDelegate?

    // MARK: - Initializers

    init(frame: CGRect, withItems itemMap: [StoreItem: [Characteristics: Int]]) {
        super.init(frame: frame)
        loadView(withItems: itemMap)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func reloadView(withItems itemMap: [StoreItem: [Characteristics: Int]]) {
        for subview in subviews {
            subview.removeFromSuperview()
        }
        loadView(withItems: itemMap)
    }

    // MARK: - Private Methods

    private func loadView(withItems itemMap: [StoreItem: [Characteristics: Int]]) {
        backgroundColor = .white
        sumOfCart = countSumOfOrder(itemMap: itemMap)
        makeOrderButton.setTitle("Оформить заказ - \(sumOfCart) р", for: .normal)
        createItemView(withItems: itemMap)
        addSubview(makeOrderButton)
        makeOrderButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
            .isActive = true
        makeOrderButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
            .isActive = true
        makeOrderButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -34)
            .isActive = true
        makeOrderButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private func countSumOfOrder(itemMap: [StoreItem: [Characteristics: Int]]) -> Int {
        var sumOfOrder = 0
        for (item, characteristics) in itemMap {
            sumOfOrder += item.coast * (characteristics[.count] ?? 0)
        }
        return sumOfOrder
    }

    private func createItemView(withItems itemMap: [StoreItem: [Characteristics: Int]]) {
        var itemCount = 0
        makeOrderButton.isHidden = itemMap.isEmpty ? true : false
        for (item, characteristic) in itemMap {
            let viewItem = UIView()
            viewItem.translatesAutoresizingMaskIntoConstraints = false
            addSubview(viewItem)

            let imageBackground = UIView()
            imageBackground.backgroundColor = .imageBackground
            imageBackground.layer.cornerRadius = 20
            imageBackground.translatesAutoresizingMaskIntoConstraints = false
            viewItem.addSubview(imageBackground)

            let itemImage = UIImageView(image: item.itemImage)
            itemImage.translatesAutoresizingMaskIntoConstraints = false
            imageBackground.addSubview(itemImage)

            let cartIcon = UIImageView(image: .cart)
            cartIcon.translatesAutoresizingMaskIntoConstraints = false
            itemImage.addSubview(cartIcon)

            let itemNameLabel = UILabel()
            itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
            itemNameLabel.text = item.name
            itemNameLabel.font = .init(name: "Verdana", size: 12)
            viewItem.addSubview(itemNameLabel)

            let numberLabel = UILabel()
            numberLabel.translatesAutoresizingMaskIntoConstraints = false
            numberLabel.text = Constants.numberLabelText
            numberLabel.font = .init(name: "Verdana", size: 12)
            viewItem.addSubview(numberLabel)

            let numberOfItemsLabel = UILabel()
            numberOfItemsLabel.translatesAutoresizingMaskIntoConstraints = false
            numberOfItemsLabel.text = String(characteristic[.count] ?? 0)
            numberOfItemsLabel.textAlignment = .center
            numberOfItemsLabel.font = .init(name: "Verdana", size: 12)
            viewItem.addSubview(numberOfItemsLabel)

            let costOfItemLabel = UILabel()
            costOfItemLabel.translatesAutoresizingMaskIntoConstraints = false
            costOfItemLabel.text = "\(item.coast) р"
            costOfItemLabel.font = .init(name: "Verdana-Bold", size: 12)
            costOfItemLabel.textAlignment = .right
            viewItem.addSubview(costOfItemLabel)

            let minusItemButton = UIButton(
                type: .custom,
                primaryAction: UIAction(title: Constants.minusChar) { _ in
                    numberOfItemsLabel.text = String((Int(numberOfItemsLabel.text ?? "0") ?? 0) - 1)
                    self.delegate?.changeItemCount(ofItem: item, count: (characteristic[.count] ?? 0) - 1)
                }
            )
            minusItemButton.translatesAutoresizingMaskIntoConstraints = false
            minusItemButton.setTitle(Constants.minusChar, for: .normal)
            minusItemButton.setTitleColor(.black, for: .normal)
            minusItemButton.titleLabel?.font = .init(name: "Verdana", size: 10)
            minusItemButton.backgroundColor = .cartButtons
            minusItemButton.layer.cornerRadius = 7.5
            viewItem.addSubview(minusItemButton)

            let plusItemButton = UIButton(
                type: .custom,
                primaryAction: UIAction(title: Constants.minusChar) { _ in
                    numberOfItemsLabel.text = String((Int(numberOfItemsLabel.text ?? "0") ?? 0) + 1)
                    self.delegate?.changeItemCount(ofItem: item, count: (characteristic[.count] ?? 0) + 1)
                }
            )
            plusItemButton.translatesAutoresizingMaskIntoConstraints = false
            plusItemButton.setTitle(Constants.plusChar, for: .normal)
            plusItemButton.setTitleColor(.black, for: .normal)
            plusItemButton.titleLabel?.font = .init(name: "Verdana", size: 10)
            plusItemButton.backgroundColor = .cartButtons
            plusItemButton.layer.cornerRadius = 7.5
            viewItem.addSubview(plusItemButton)

            let sizeLabel = UILabel()
            sizeLabel.translatesAutoresizingMaskIntoConstraints = false
            sizeLabel.text = Constants.sizeLabelText
            sizeLabel.font = .init(name: "Verdana", size: 12)
            viewItem.addSubview(sizeLabel)

            let costLabel = UILabel()
            costLabel.translatesAutoresizingMaskIntoConstraints = false
            costLabel.text = Constants.costLabelText
            costLabel.font = .init(name: "Verdana", size: 12)
            viewItem.addSubview(costLabel)

            createConstraints()
            createSizeButtons()

            func createSizeButtons() {
                var countOfbuttons = 0
                for size in Constants.minSize ... Constants.maxSize {
                    let button = createSizeButton(size: size)
                    button.tag = size
                    if size == characteristic[.size] {
                        button.layer.borderColor = Constants.magentaColor
                    }
                    viewItem.addSubview(button)
                    if countOfbuttons <= Constants.sizeButtonInLineCount - 1 {
                        button.leadingAnchor.constraint(
                            equalTo: imageBackground.trailingAnchor,
                            constant: CGFloat(22 + countOfbuttons * 35)
                        ).isActive = true
                        button.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 10).isActive = true
                        button.heightAnchor.constraint(equalToConstant: 17).isActive = true
                        button.widthAnchor.constraint(equalToConstant: 31).isActive = true
                    } else {
                        button.leadingAnchor.constraint(
                            equalTo: imageBackground.trailingAnchor,
                            constant: CGFloat(22 + (countOfbuttons - Constants.sizeButtonInLineCount) * 35)
                        ).isActive = true
                        button.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 31).isActive = true
                        button.heightAnchor.constraint(equalToConstant: 17).isActive = true
                        button.widthAnchor.constraint(equalToConstant: 31).isActive = true
                    }
                    countOfbuttons += 1
                }
            }

            func createSizeButton(size: Int) -> UIButton {
                let button = UIButton(
                    type: .custom,
                    primaryAction: UIAction(title: String(size)) { _ in
                        self.delegate?.changeItemSize(forItem: item, newSize: size)
                        for button in viewItem.subviews where button is UIButton {
                            if button.tag == size {
                                button.layer.borderColor = Constants.magentaColor
                            } else {
                                button.layer.borderColor = CGColor(gray: 0, alpha: 0)
                            }
                        }
                    }
                )
                button.translatesAutoresizingMaskIntoConstraints = false
                button.setTitle(String(size), for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.titleLabel?.font = .init(name: "Verdana", size: 10)
                button.backgroundColor = .cartButtons
                button.layer.borderWidth = 1
                button.layer.borderColor = CGColor(gray: 0, alpha: 0)
                button.layer.cornerRadius = 8.5
                return button
            }

            func createConstraints() {
                viewItem.topAnchor.constraint(
                    equalTo: safeAreaLayoutGuide.topAnchor,
                    constant: CGFloat(20 + 177 * itemCount)
                )
                .isActive = true
                viewItem.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
                    .isActive = true
                viewItem.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
                    .isActive = true
                viewItem.heightAnchor.constraint(equalToConstant: 157).isActive = true

                imageBackground.leadingAnchor.constraint(equalTo: viewItem.leadingAnchor).isActive = true
                imageBackground.topAnchor.constraint(equalTo: viewItem.topAnchor).isActive = true
                imageBackground.bottomAnchor.constraint(equalTo: viewItem.bottomAnchor).isActive = true
                imageBackground.widthAnchor.constraint(equalTo: imageBackground.heightAnchor).isActive = true

                itemImage.centerXAnchor.constraint(equalTo: imageBackground.centerXAnchor).isActive = true
                itemImage.centerYAnchor.constraint(equalTo: imageBackground.centerYAnchor).isActive = true
                itemImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
                itemImage.widthAnchor.constraint(equalToConstant: 100).isActive = true

                cartIcon.topAnchor.constraint(equalTo: imageBackground.topAnchor, constant: 11.5).isActive = true
                cartIcon.trailingAnchor.constraint(equalTo: imageBackground.trailingAnchor, constant: -10)
                    .isActive = true
                cartIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
                cartIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true

                itemNameLabel.leadingAnchor.constraint(equalTo: imageBackground.trailingAnchor, constant: 16)
                    .isActive = true
                itemNameLabel.topAnchor.constraint(equalTo: viewItem.topAnchor, constant: 18).isActive = true
                itemNameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
                itemNameLabel.trailingAnchor.constraint(equalTo: viewItem.trailingAnchor).isActive = true

                numberLabel.leadingAnchor.constraint(equalTo: imageBackground.trailingAnchor, constant: 16)
                    .isActive = true
                numberLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 12).isActive = true
                numberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
                numberLabel.trailingAnchor.constraint(equalTo: viewItem.trailingAnchor, constant: -80).isActive = true

                minusItemButton.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 15)
                    .isActive = true
                minusItemButton.topAnchor.constraint(equalTo: numberLabel.topAnchor).isActive = true
                minusItemButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
                minusItemButton.widthAnchor.constraint(equalTo: minusItemButton.heightAnchor).isActive = true

                plusItemButton.leadingAnchor.constraint(equalTo: minusItemButton.trailingAnchor, constant: 23)
                    .isActive = true
                plusItemButton.topAnchor.constraint(equalTo: numberLabel.topAnchor).isActive = true
                plusItemButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
                plusItemButton.widthAnchor.constraint(equalTo: minusItemButton.heightAnchor).isActive = true

                numberOfItemsLabel.leadingAnchor.constraint(equalTo: minusItemButton.trailingAnchor, constant: 3)
                    .isActive = true
                numberOfItemsLabel.topAnchor.constraint(equalTo: numberLabel.topAnchor).isActive = true
                numberOfItemsLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
                numberOfItemsLabel.widthAnchor.constraint(equalTo: minusItemButton.heightAnchor).isActive = true

                sizeLabel.leadingAnchor.constraint(equalTo: imageBackground.trailingAnchor, constant: 16)
                    .isActive = true
                sizeLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 12).isActive = true
                sizeLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
                sizeLabel.trailingAnchor.constraint(equalTo: viewItem.trailingAnchor).isActive = true

                costLabel.leadingAnchor.constraint(equalTo: imageBackground.trailingAnchor, constant: 16)
                    .isActive = true
                costLabel.bottomAnchor.constraint(equalTo: imageBackground.bottomAnchor).isActive = true
                costLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
                costLabel.trailingAnchor.constraint(equalTo: viewItem.trailingAnchor).isActive = true

                costOfItemLabel.leadingAnchor.constraint(equalTo: imageBackground.trailingAnchor, constant: 16)
                    .isActive = true
                costOfItemLabel.bottomAnchor.constraint(equalTo: imageBackground.bottomAnchor).isActive = true
                costOfItemLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
                costOfItemLabel.trailingAnchor.constraint(equalTo: viewItem.trailingAnchor).isActive = true
            }
            itemCount += 1
        }
    }
}
