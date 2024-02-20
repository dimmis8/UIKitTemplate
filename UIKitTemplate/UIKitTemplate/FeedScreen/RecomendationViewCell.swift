// RecomendationViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с рекомендациями
final class RecomendationViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let recomendationLabelText = "Рекомендуем вам"
        static let allLabelText = "Все"
        static let subscribeButtonText = "Подписаться"
        static let recomindationWithSpacingWidth = 205
    }

    // MARK: - Visual Components

    private let scrollView = UIScrollView()

    private let recomendationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let profilePhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.image = .gigachad
        return imageView
    }()

    private let recomendationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.recomendationLabelText
        label.font = .init(name: "Verdana-Bold", size: 11)
        label.textAlignment = .center
        return label
    }()

    private let allLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.allLabelText
        label.font = .init(name: "Verdana-Bold", size: 11)
        label.textColor = .systemBlue
        label.textAlignment = .right
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func loadRecomendation(_ recomendations: [Recomendation]) {
        var currentRecomendationNumber = 0
        for recomendation in recomendations {
            let recomendationView: UIView = {
                let view = UIView()
                view.translatesAutoresizingMaskIntoConstraints = false
                view.backgroundColor = .white
                return view
            }()

            let imageView: UIImageView = {
                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFill
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.layer.cornerRadius = 57.5
                imageView.clipsToBounds = true
                imageView.image = recomendation.photo
                return imageView
            }()

            let label: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = recomendation.nickname
                label.font = .init(name: "Verdana", size: 10)
                label.textAlignment = .center
                return label
            }()

            let buttonSubscribe: UIButton = {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.setTitle(Constants.subscribeButtonText, for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = .init(name: "Verdana-Bold", size: 11)
                button.layer.cornerRadius = 8
                button.backgroundColor = .systemBlue
                return button
            }()

            let closeImageView: UIImageView = {
                let imageView = UIImageView()
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.image = UIImage(systemName: "xmark")
                imageView.contentMode = .scaleAspectFit
                imageView.tintColor = .black
                return imageView
            }()

            scrollView.addSubview(recomendationView)
            recomendationView.addSubview(imageView)
            recomendationView.addSubview(label)
            recomendationView.addSubview(buttonSubscribe)
            recomendationView.addSubview(closeImageView)

            recomendationView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: CGFloat(17 + Int(currentRecomendationNumber) * Constants.recomindationWithSpacingWidth)
            ).isActive = true
            recomendationView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45).isActive = true
            recomendationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            recomendationView.widthAnchor.constraint(equalToConstant: 185).isActive = true

            imageView.centerXAnchor.constraint(equalTo: recomendationView.centerXAnchor).isActive = true
            imageView.topAnchor.constraint(equalTo: recomendationView.topAnchor, constant: 15).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true

            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
            label.heightAnchor.constraint(equalToConstant: 12).isActive = true
            label.widthAnchor.constraint(equalToConstant: 100).isActive = true

            buttonSubscribe.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
            buttonSubscribe.bottomAnchor.constraint(equalTo: recomendationView.bottomAnchor, constant: -14)
                .isActive = true
            buttonSubscribe.heightAnchor.constraint(equalToConstant: 30).isActive = true
            buttonSubscribe.widthAnchor.constraint(equalToConstant: 165).isActive = true

            closeImageView.trailingAnchor.constraint(equalTo: recomendationView.trailingAnchor, constant: -8.5)
                .isActive = true
            closeImageView.bottomAnchor.constraint(equalTo: recomendationView.topAnchor, constant: 20).isActive = true
            closeImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
            closeImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true

            if currentRecomendationNumber == recomendations.count - 1 {
                imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
                print(currentRecomendationNumber)
            }
            currentRecomendationNumber += 1
        }
    }

    // MARK: - Private Methods

    private func createView() {
        backgroundColor = .backgroundRecomendation
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        contentView.addSubview(scrollView)
        contentView.addSubview(recomendationLabel)
        contentView.addSubview(allLabel)
        scrollView.addSubview(recomendationView)
    }

    private func setConstraints() {
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 270).isActive = true

        recomendationView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 17).isActive = true
        recomendationView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45).isActive = true
        recomendationView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 25).isActive = true
        recomendationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        recomendationView.widthAnchor.constraint(equalToConstant: 185).isActive = true

        recomendationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9).isActive = true
        recomendationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        recomendationLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        recomendationLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true

        allLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9).isActive = true
        allLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        allLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        allLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
    }
}
