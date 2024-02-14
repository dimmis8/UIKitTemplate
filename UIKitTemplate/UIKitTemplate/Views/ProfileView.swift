// ProfileView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
final class ProfileView: UIView {
    // MARK: - Constants

    enum Constants {
        /// Соотношение сторон дисконтной карты
        static let aspectRatioOfCardBackground: CGFloat = 180 / 315
    }

    // MARK: - Visual Components

    private let discontCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 20
        return view
    }()

    private let cardLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .logoCard
        return imageView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func loadView() {
        backgroundColor = .white
        addSubview(discontCard)

        createConstraintsForSubviews()
    }

    func createConstraintsForSubviews() {
        NSLayoutConstraint.activate([
            // констрейнты дисконтной карты
            discontCard.centerXAnchor.constraint(equalTo: centerXAnchor),
            discontCard.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 23),
            discontCard.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            discontCard.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            discontCard.heightAnchor.constraint(
                equalTo: discontCard.widthAnchor,
                multiplier: Constants.aspectRatioOfCardBackground
            )
        ])
    }
}
