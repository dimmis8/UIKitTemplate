// AdressView.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// вью с адресами кофеен
final class AdressView: UIView {
    // MARK: - Visual Components

    private let adressTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Адреса кофеен"
        label.frame = CGRect(x: 15, y: 12, width: 150, height: 15)
        label.font = UIFont(name: "Verdana-Bold", size: 12)
        return label
    }()

    private let adressInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни "
        label.numberOfLines = 0
        label.textColor = .gray
        label.frame = CGRect(x: 15, y: 30, width: 260, height: 30)
        label.font = UIFont(name: "Verdana", size: 12)
        return label
    }()

    private let navigtionImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        image.frame = CGRect(x: 289, y: 20, width: 21, height: 30)
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
        backgroundColor = UIColor(red: 235 / 255.0, green: 246 / 255.0, blue: 247 / 255.0, alpha: 1)
        [navigtionImage, adressInfoLabel, adressTitleLabel].forEach { addSubview($0) }
    }
}
