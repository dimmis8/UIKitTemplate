// MenuView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью для меню вью контроллера с меню
final class MenuView: UIView {
    // MARK: - Constants

    enum Constant {
        static let coffeButtonText = "Кофий"
        static let pieButtonText = "Пти пате аля «РюсЪ»"
        static let hotDrinkButtonText = "Горячiя напитки"
        static let navigtionLabelText = "Mинью"
    }

    // MARK: - Visual Components

    /// кастомная вью с локацией заведения
    private var adressView = AdressView()

    lazy var coffeButton = CustomButton(
        name: Constant.coffeButtonText,
        nameImage: .coffie,
        right: 190,
        frame: CGRect(x: 20, y: 416, width: 335, height: 80)
    )

    private lazy var pieButton = CustomButton(
        name: Constant.pieButtonText,
        nameImage: .pae,
        right: 50,
        frame: CGRect(x: 20, y: 216, width: 335, height: 80)
    )

    private lazy var hotDrinkButton = CustomButton(
        name: Constant.hotDrinkButtonText,
        nameImage: .image,
        right: 100,
        frame: CGRect(x: 20, y: 316, width: 335, height: 80)
    )

    private let navigtionLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.navigtionLabelText
        label.frame = CGRect(x: 125, y: 122, width: 125, height: 40)
        label.textAlignment = .center
        label.font = UIFont(name: "AmaticSC-Bold", size: 25)

        return label
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .gravira
        imageView.frame = CGRect(x: 137, y: 162, width: 100, height: 40)
        imageView.sizeToFit()
        return imageView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Private Methods

    /// добавление элементов на вью
    private func setupView() {
        backgroundColor = .white
        addSubview(coffeButton)
        addSubview(adressView)
        addSubview(adressView)
        addSubview(iconImageView)
        addSubview(pieButton)
        addSubview(hotDrinkButton)
        addSubview(navigtionLabel)
        adressView.frame = CGRect(x: 20, y: 40, width: 335, height: 70)
        adressView.layer.cornerRadius = 16
        coffeButton.tintColor = .black
    }
}
