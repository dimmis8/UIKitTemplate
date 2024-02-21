// RecomendationsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с рекомендациями
final class RecomendationsViewCell: UITableViewCell {
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
            let recomendationView = RecomendationView(
                avatarName: recomendation.avatarName,
                nickName: recomendation.avatarName
            )
            recomendationView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(recomendationView)

            recomendationView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: CGFloat(17 + Int(currentRecomendationNumber) * Constants.recomindationWithSpacingWidth)
            ).isActive = true
            recomendationView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45).isActive = true
            recomendationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            recomendationView.widthAnchor.constraint(equalToConstant: 185).isActive = true

            if currentRecomendationNumber == recomendations.count - 1 {
                recomendationView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
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
