// NotificationViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка уведомления
final class NotificationViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let secondsInOneDay = 60.0 * 60.0 * 24.0
        static let subscribeButtonText = "Подписаться"
        static let subscribedButtonText = "Вы подписаны"
    }

    // MARK: - Visual Components

    private let profilePhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.image = .djigan
        return imageView
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
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

    func loadNotification(_ notification: NotificationApp) {
        profilePhoto.image = notification.avatar

        // Работа с описанием
        let timeInterval = Date().timeIntervalSince(notification.dateOfNotification)
        let daysAgo = Int(timeInterval / Constants.secondsInOneDay)
        let boldAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 12)]
        let attributedString = NSMutableAttributedString(
            string: notification.nickname + ": " + notification
                .description + " \(daysAgo)д."
        )
        let grayAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.lightGray]
        attributedString.addAttributes(
            boldAttributes,
            range: NSRange(location: 0, length: notification.nickname.count + 1)
        )
        attributedString.addAttributes(
            grayAttributes,
            range: NSRange(
                location: notification.nickname.count + 2 + notification.description.count,
                length: " \(daysAgo)д.".count
            )
        )
        descriptionLabel.attributedText = attributedString

        // Работа с изображением или кнопкой:
        if let image = notification.photo {
            let photoImageView: UIImageView = {
                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFill
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.clipsToBounds = true
                imageView.image = image
                return imageView
            }()
            contentView.addSubview(photoImageView)
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
            photoImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor).isActive = true
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
            descriptionLabel.trailingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: -9)
                .isActive = true
        } else {
            let buttonSubscribe: UIButton = {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.setTitle(Constants.subscribeButtonText, for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = .init(name: "Verdana-Bold", size: 12)
                button.layer.cornerRadius = 8
                button.backgroundColor = .systemBlue
                return button
            }()
            buttonSubscribe.addTarget(self, action: #selector(changeSubscribeStatus(sender:)), for: .touchUpInside)
            contentView.addSubview(buttonSubscribe)
            buttonSubscribe.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
            buttonSubscribe.heightAnchor.constraint(equalToConstant: 30).isActive = true
            buttonSubscribe.widthAnchor.constraint(equalToConstant: 140).isActive = true
            buttonSubscribe.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
                .isActive = true
            descriptionLabel.trailingAnchor.constraint(equalTo: buttonSubscribe.leadingAnchor, constant: -9)
                .isActive = true
        }
    }

    @objc private func changeSubscribeStatus(sender: UIButton) {
        if sender.titleLabel?.text == Constants.subscribeButtonText {
            sender.setTitle(Constants.subscribedButtonText, for: .normal)
            sender.setTitleColor(.lightGray, for: .normal)
            sender.backgroundColor = .white
            sender.layer.borderWidth = 1
            sender.layer.borderColor = CGColor(gray: 0.2, alpha: 0.2)
        } else {
            sender.setTitle(Constants.subscribeButtonText, for: .normal)
            sender.setTitleColor(.white, for: .normal)
            sender.backgroundColor = .systemBlue
            sender.layer.borderWidth = 0
        }
    }

    // MARK: - Private Methods

    private func createView() {
        backgroundColor = .white
        contentView.addSubview(profilePhoto)
        contentView.addSubview(descriptionLabel)
    }

    private func setConstraints() {
        profilePhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        profilePhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        profilePhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        profilePhoto.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profilePhoto.widthAnchor.constraint(equalTo: profilePhoto.heightAnchor).isActive = true

        descriptionLabel.leadingAnchor.constraint(equalTo: profilePhoto.trailingAnchor, constant: 7).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
    }
}
