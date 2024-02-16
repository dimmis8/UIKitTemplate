// SectionsCellView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомная вью с лейблом и картинкой
final class SectionsCellView: UIView {
    // MARK: - Constants

    enum Constants {
        static let nameFont = "Verdana-Bold"
        static let newItemsLabelSize = 14
    }

    // MARK: - Visual Components

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.nameFont, size: CGFloat(Constants.newItemsLabelSize))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    private let nameImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        activateConstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        activateConstraint()
    }

    // MARK: - Public Properties

    func setNameLabel(name: String, image: UIImage) {
        nameLabel.text = name
        nameImageView.image = image
    }

    func setImage(image: UIImage?) {
        nameImageView.image = image
    }

    // MARK: - Private Methods

    private func setupView() {
        addSubview(nameLabel)
        addSubview(nameImageView)
        backgroundColor = .whiteBackground
    }

    private func activateConstraint() {
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 31).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nameImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            .isActive = true
    }
}
