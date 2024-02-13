// MenuView.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// вью для меню вью контроллера
final class MenuView: UIView {
    // MARK: - Visual Components

    var adressView = AdressView()

    lazy var coffeButton = CustomButton(
        name: "Кофий",
        nameImage: "кофе",
        right: 190,
        frame: CGRect(x: 20, y: 416, width: 335, height: 80)
    )

    lazy var pieButton = CustomButton(
        name: "Пти пате аля «РюсЪ»",
        nameImage: "pae",
        right: 50,
        frame: CGRect(x: 20, y: 216, width: 335, height: 80)
    )

    lazy var hotDrinkButton = CustomButton(
        name: "Горячiя напитки",
        nameImage: "image",
        right: 100,
        frame: CGRect(x: 20, y: 316, width: 335, height: 80)
    )

    let menuImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        image.frame = CGRect(x: 289, y: 20, width: 21, height: 30)
        return image
    }()

    let navigtionLabel: UILabel = {
        let label = UILabel()
        label.text = "Mинью"
        label.frame = CGRect(x: 125, y: 122, width: 125, height: 40)
        label.textAlignment = .center
        label.font = UIFont(name: "AmaticSC-Bold", size: 25)

        return label
    }()

    let iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gravira")
        image.frame = CGRect(x: 137, y: 162, width: 100, height: 40)
        image.sizeToFit()
        return image
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

    private func setupView() {
        backgroundColor = .white
        addSubview(coffeButton)
        addSubview(adressView)
        addSubview(adressView)
        addSubview(iconImage)
        addSubview(pieButton)
        addSubview(hotDrinkButton)
        addSubview(navigtionLabel)
        adressView.frame = CGRect(x: 20, y: 40, width: 335, height: 70)
        adressView.layer.cornerRadius = 16
        coffeButton.tintColor = .black
    }
}
