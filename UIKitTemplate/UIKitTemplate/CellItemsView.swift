// CellItemsView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// adwdaw
final class CellItemsView: UIView {
    // MARK: - Constants

    enum Constants {
        static let nameFont = "Verdana-Bold"
        static let newItemsLabelSize = 10
    }

    // MARK: - Visual Components

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.nameFont, size: CGFloat(Constants.newItemsLabelSize))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()

    let nameImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let basketButton: UIButton = {
        let button = UIButton()
        button.setImage(.grayBasket, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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

    // MARK: - Private Properties

    private func setupView() {
        addSubview(nameLabel)
        addSubview(nameImageView)
        addSubview(basketButton)
        backgroundColor = .whiteBackground
    }

    private func activateConstraint() {
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        nameLabel.topAnchor.constraint(equalTo: nameImageView.bottomAnchor, constant: 4).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true

        nameImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameImageView.widthAnchor.constraint(equalToConstant: 100)
            .isActive = true
        nameImageView.heightAnchor.constraint(equalToConstant: 100)
            .isActive = true

        basketButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        basketButton.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        basketButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        basketButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
