// ProfileViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка профиля
final class ProfileViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let subscribeLabelText = "подписки"
        static let subscribersLabelText = "подписчики"
        static let postsCountLabelText = "публикации"
        static let changeProfileButtonText = "Изменить"
        static let shareProfileButtonText = "Поделиться профилем"
    }

    // MARK: - Visual Components

    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        return imageView
    }()

    private let addStoryButtont: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let plusImageView = UIImageView()
        plusImageView.image = .addButton
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(plusImageView)
        plusImageView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        plusImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        plusImageView.heightAnchor.constraint(equalToConstant: 10).isActive = false
        plusImageView.widthAnchor.constraint(equalToConstant: 10).isActive = false
        button.backgroundColor = .pinkAddButton
        button.layer.cornerRadius = 13.5
        return button
    }()

    private let subscribeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.subscribeLabelText
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()

    private let subscribersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.subscribersLabelText
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()

    private let postsCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.postsCountLabelText
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()

    private let subscribeNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    private let subscribersNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    private let postsCountNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    private let profileUserNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()

    private let discriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private let additionalInfoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()

    private let changeProfileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.changeProfileButtonText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 11)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 7
        return button
    }()

    private let shareProfileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.shareProfileButtonText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 11)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 7
        return button
    }()

    private let addUserButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.addUser, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 7
        return button
    }()

    // MARK: - Public Properties

    var discriptionButtonComplitionHandler: ((String?) -> ())?

    // MARK: - Private Properties

    private var linkToBrowser: String?

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

    func setProfileInfo(_ info: ProfileInfo) {
        profilePhotoImageView.image = UIImage(named: info.avatarName)
        subscribeNumberLabel.text = String(info.subscribtionsNumber)
        subscribersNumberLabel.text = String(info.subscrubersNumber)
        postsCountNumberLabel.text = String(info.postsNumber)
        profileUserNameLabel.text = info.userName
        discriptionLabel.text = info.description
        additionalInfoButton.setTitle(info.additionInfo, for: .normal)
        linkToBrowser = info.additionInfo
    }

    // MARK: - Private Methods

    private func createView() {
        backgroundColor = .white
        contentView.addSubview(profilePhotoImageView)
        contentView.addSubview(addStoryButtont)
        contentView.addSubview(subscribeLabel)
        contentView.addSubview(subscribersLabel)
        contentView.addSubview(postsCountLabel)
        contentView.addSubview(subscribeNumberLabel)
        contentView.addSubview(subscribersNumberLabel)
        contentView.addSubview(postsCountNumberLabel)
        contentView.addSubview(profileUserNameLabel)
        contentView.addSubview(discriptionLabel)
        contentView.addSubview(additionalInfoButton)
        contentView.addSubview(changeProfileButton)
        contentView.addSubview(shareProfileButton)
        contentView.addSubview(addUserButton)
        additionalInfoButton.addTarget(self, action: #selector(descriptionButtonAction), for: .touchUpInside)
    }

    private func setConstraints() {
        setProfilePhotoImageViewConstraints()
        setAddStoryButtontConstraints()
        setSubscribeLabelConstraints()
        setSubscribersLabelConstraints()
        setPostsCountLabelConstraints()
        setSubscribeNumberLabelConstraints()
        setSubscribersNumberLabelConstraints()
        setPostsCountNumberLabelConstraints()
        setProfileUserNameLabelConstraints()
        setDiscriptionLabelConstraints()
        setAdditionalInfoButtonConstraints()
        setChangeProfileButtonConstraints()
        setShareProfileButtonConstraints()
        setAddUserButtonConstraints()
    }

    @objc private func descriptionButtonAction() {
        discriptionButtonComplitionHandler?(linkToBrowser)
    }

    private func setProfilePhotoImageViewConstraints() {
        profilePhotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27).isActive = true
        profilePhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -120).isActive = true
        profilePhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        profilePhotoImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        profilePhotoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setAddStoryButtontConstraints() {
        addStoryButtont.trailingAnchor.constraint(equalTo: profilePhotoImageView.trailingAnchor).isActive = true
        addStoryButtont.bottomAnchor.constraint(equalTo: profilePhotoImageView.bottomAnchor).isActive = true
        addStoryButtont.widthAnchor.constraint(equalToConstant: 27).isActive = true
        addStoryButtont.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func setSubscribeLabelConstraints() {
        subscribeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23).isActive = true
        subscribeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 56).isActive = true
        subscribeLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscribeLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setSubscribersLabelConstraints() {
        subscribersLabel.trailingAnchor.constraint(equalTo: subscribeLabel.leadingAnchor).isActive = true
        subscribersLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 56).isActive = true
        subscribersLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscribersLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setPostsCountLabelConstraints() {
        postsCountLabel.trailingAnchor.constraint(equalTo: subscribersLabel.leadingAnchor).isActive = true
        postsCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 56).isActive = true
        postsCountLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        postsCountLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setSubscribeNumberLabelConstraints() {
        subscribeNumberLabel.centerXAnchor.constraint(equalTo: subscribeLabel.centerXAnchor).isActive = true
        subscribeNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 37).isActive = true
        subscribeNumberLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subscribeNumberLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setSubscribersNumberLabelConstraints() {
        subscribersNumberLabel.centerXAnchor.constraint(equalTo: subscribersLabel.centerXAnchor).isActive = true
        subscribersNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 37).isActive = true
        subscribersNumberLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subscribersNumberLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setPostsCountNumberLabelConstraints() {
        postsCountNumberLabel.centerXAnchor.constraint(equalTo: postsCountLabel.centerXAnchor).isActive = true
        postsCountNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 37).isActive = true
        postsCountNumberLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        postsCountNumberLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setProfileUserNameLabelConstraints() {
        profileUserNameLabel.leadingAnchor.constraint(equalTo: profilePhotoImageView.leadingAnchor).isActive = true
        profileUserNameLabel.topAnchor.constraint(equalTo: profilePhotoImageView.bottomAnchor, constant: 9)
            .isActive = true
        profileUserNameLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        profileUserNameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setDiscriptionLabelConstraints() {
        discriptionLabel.leadingAnchor.constraint(equalTo: profileUserNameLabel.leadingAnchor).isActive = true
        discriptionLabel.topAnchor.constraint(equalTo: profileUserNameLabel.bottomAnchor, constant: 5)
            .isActive = true
        discriptionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        discriptionLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setAdditionalInfoButtonConstraints() {
        additionalInfoButton.leadingAnchor.constraint(equalTo: profileUserNameLabel.leadingAnchor).isActive = true
        additionalInfoButton.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 5)
            .isActive = true
        additionalInfoButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        additionalInfoButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setChangeProfileButtonConstraints() {
        changeProfileButton.leadingAnchor.constraint(equalTo: profileUserNameLabel.leadingAnchor).isActive = true
        changeProfileButton.topAnchor.constraint(equalTo: additionalInfoButton.bottomAnchor, constant: 15)
            .isActive = true
        changeProfileButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        changeProfileButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func setShareProfileButtonConstraints() {
        shareProfileButton.leadingAnchor.constraint(equalTo: changeProfileButton.trailingAnchor, constant: 5)
            .isActive = true
        shareProfileButton.topAnchor.constraint(equalTo: additionalInfoButton.bottomAnchor, constant: 15)
            .isActive = true
        shareProfileButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        shareProfileButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func setAddUserButtonConstraints() {
        addUserButton.leadingAnchor.constraint(equalTo: shareProfileButton.trailingAnchor, constant: 5).isActive = true
        addUserButton.topAnchor.constraint(equalTo: additionalInfoButton.bottomAnchor, constant: 15)
            .isActive = true
        addUserButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        addUserButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
}
