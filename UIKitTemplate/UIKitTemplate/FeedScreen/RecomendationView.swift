// RecomendationView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью с рекомендацией
final class RecomendationView: UIView {
    // MARK: - Constants

    enum Constants {
        static let recomendationLabelText = "Рекомендуем вам"
        static let allLabelText = "Все"
        static let subscribeButtonText = "Подписаться"
    }

    // MARK: - Visual Components

    private let recomendationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 57.5
        imageView.clipsToBounds = true
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(name: "Verdana", size: 10)
        label.textAlignment = .center
        return label
    }()

    private let buttonSubscribe: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.subscribeButtonText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .init(name: "Verdana-Bold", size: 11)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        return button
    }()

    private let closeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "xmark")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()

    // MARK: - Initializers

    init(avatarName: String, nickName: String) {
        super.init(frame: CGRect())
        loadView(avatarName: avatarName, nickName: nickName)
        createConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func loadView(avatarName: String, nickName: String) {
        backgroundColor = .white
        imageView.image = UIImage(named: avatarName)
        label.text = nickName
        addSubview(imageView)
        addSubview(label)
        addSubview(buttonSubscribe)
        addSubview(closeImageView)
    }

    private func createConstraints() {
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true

        label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        label.heightAnchor.constraint(equalToConstant: 12).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true

        buttonSubscribe.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        buttonSubscribe.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
            .isActive = true
        buttonSubscribe.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonSubscribe.widthAnchor.constraint(equalToConstant: 165).isActive = true

        closeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.5)
            .isActive = true
        closeImageView.bottomAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        closeImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        closeImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }
}
