// StoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью с историей
final class StoryView: UIView {
    // MARK: - Constants

    enum Constants {
        static let yourStoryText = "Ваша история"
        static let storyWithSpasingWeight = 86
        static let borderRadius: CGFloat = 63
    }

    // MARK: - Visual Components

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(name: "Verdana", size: 8)
        label.textAlignment = .center
        return label
    }()

    private let borderView: UIImageView = {
        let borderView = UIImageView()
        borderView.contentMode = .scaleAspectFill
        borderView.translatesAutoresizingMaskIntoConstraints = false
        return borderView
    }()

    // MARK: - Initializers

    init(avatarName: String, description: String, status: StatusOfStory) {
        super.init(frame: CGRect())
        loadView(avatarName: avatarName, description: description, status: status)
        createConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func loadView(avatarName: String, description: String, status: StatusOfStory) {
        imageView.image = UIImage(named: avatarName)
        label.text = description
        addSubview(imageView)
        addSubview(label)
        createStoryBorder(status)
    }

    private func createConstraints() {
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true

        label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        label.heightAnchor.constraint(equalToConstant: 10).isActive = true
        label.widthAnchor.constraint(equalToConstant: 74).isActive = true
    }

    private func createStoryBorder(_ status: StatusOfStory) {
        addSubview(borderView)
        borderView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        borderView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        switch status {
        case .isNotViewed:
            borderView.image = .newStory
            borderView.heightAnchor.constraint(equalToConstant: Constants.borderRadius).isActive = true
        case .profileStory:
            borderView.image = .profileStoryBorder
            borderView.heightAnchor.constraint(equalToConstant: Constants.borderRadius + 4).isActive = true
        default:
            break
        }
        borderView.widthAnchor.constraint(equalTo: borderView.heightAnchor).isActive = true
    }
}
