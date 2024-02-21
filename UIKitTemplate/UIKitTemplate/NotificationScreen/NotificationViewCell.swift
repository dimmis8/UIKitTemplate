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

    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
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
        profilePhotoImageView.image = UIImage(named: notification.avatarImageName)
        setDecriptionText(notification)
        if let image = notification.photoPostName {
            addImage(withName: image)
        } else {
            addButton()
        }
    }

    // MARK: - Private Methods

    private func createView() {
        backgroundColor = .white
        contentView.addSubview(profilePhotoImageView)
        contentView.addSubview(descriptionLabel)
    }
    
    private func setDecriptionText(_ notification: NotificationApp) {
        let timeInterval = Date().timeIntervalSince(notification.dateOfNotification)
        let daysAgo = Int(timeInterval / Constants.secondsInOneDay)
        let boldAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 12)]
        let attributedString = NSMutableAttributedString(
            string: notification.nickName + ": " + notification
                .description + " \(daysAgo)д."
        )
        let grayAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.lightGray]
        attributedString.addAttributes(
            boldAttributes,
            range: NSRange(location: 0, length: notification.nickName.count + 1)
        )
        attributedString.addAttributes(
            grayAttributes,
            range: NSRange(
                location: notification.nickName.count + 2 + notification.description.count,
                length: " \(daysAgo)д.".count
            )
        )
        descriptionLabel.attributedText = attributedString
    }
    
    private func addImage(withName name: String) {
        let photoImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: name)
            return imageView
        }()
        contentView.addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: -9)
            .isActive = true
    }
    
    private func addButton() {
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
        buttonSubscribe.addTarget(self, action: #selector(changeSubscribeStatusHandler(sender:)), for: .touchUpInside)
        contentView.addSubview(buttonSubscribe)
        buttonSubscribe.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        buttonSubscribe.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonSubscribe.widthAnchor.constraint(equalToConstant: 140).isActive = true
        buttonSubscribe.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
            .isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: buttonSubscribe.leadingAnchor, constant: -9)
            .isActive = true
    }

    private func setConstraints() {
        profilePhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        profilePhotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        profilePhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        profilePhotoImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profilePhotoImageView.widthAnchor.constraint(equalTo: profilePhotoImageView.heightAnchor).isActive = true

        descriptionLabel.leadingAnchor.constraint(equalTo: profilePhotoImageView.trailingAnchor, constant: 7).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
    }
    
    @objc private func changeSubscribeStatusHandler(sender: UIButton) {
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
}
