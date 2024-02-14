// AdressView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью с адресами кофеен
final class AdressView: UIView {
    // MARK: - Constants

    enum Constant {
        static let adressTitleLabelText = "Адреса кофеен"
        static let adressInfoLabelText = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни "
    }

    // MARK: - Visual Components

    private let adressTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.adressTitleLabelText
        label.frame = CGRect(x: 15, y: 12, width: 150, height: 15)
        label.font = UIFont(name: "Verdana-Bold", size: 12)
        return label
    }()

    private let adressInfoLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.adressInfoLabelText
        label.numberOfLines = 0
        label.textColor = .gray
        label.frame = CGRect(x: 15, y: 30, width: 260, height: 30)
        label.font = UIFont(name: "Verdana", size: 12)
        return label
    }()

    private let navigtionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        imageView.frame = CGRect(x: 289, y: 20, width: 21, height: 30)
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

    private func setupView() {
        /// Значение 255 обозначает максимально возможную интенсивность выбранного цвета в RGB-модели.
        backgroundColor = UIColor(red: 235 / 255.0, green: 246 / 255.0, blue: 247 / 255.0, alpha: 1)
        [navigtionImageView, adressInfoLabel, adressTitleLabel].forEach { addSubview($0) }
    }
}
