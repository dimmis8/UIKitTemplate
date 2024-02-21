// StoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью с историей
final class StoryView: UIView {
    // MARK: - Constants

    enum Constants {
        static let yourStoryText = "Ваша история"
        static let storyWithSpasingWeight = 86
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

    // MARK: - Initializers

    init(avatarName: String, nickName: String, status: ViewingStatus) {
        super.init(frame: CGRect())
        loadView(avatarName: avatarName, nickName: nickName, status: status)
        createConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func loadView(avatarName: String, nickName: String, status: ViewingStatus) {
        imageView.image = UIImage(named: avatarName)
        label.text = nickName
        addSubview(imageView)
        addSubview(label)
        if status == .isNotViewed {
            createBorder()
        }
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

    private func createBorder() {
        let borderView: UIImageView = {
            let borderView = UIImageView()
            borderView.contentMode = .scaleAspectFill
            borderView.translatesAutoresizingMaskIntoConstraints = false
            borderView.image = .newStory
            return borderView
        }()
        addSubview(borderView)
        borderView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        borderView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        borderView.heightAnchor.constraint(equalToConstant: 63).isActive = true
        borderView.widthAnchor.constraint(equalToConstant: 63).isActive = true
    }
}
