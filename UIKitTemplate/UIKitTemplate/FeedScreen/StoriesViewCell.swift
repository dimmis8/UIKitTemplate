// StoriesViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка сториз
final class StoriesViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let yourStoryText = "Ваша история"
        static let storyWithSpasingWeight = 86
    }

    // MARK: - Visual Components

    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()

    private let yourStoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.yourStoryText
        label.font = .init(name: "Verdana", size: 8)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
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
        button.layer.cornerRadius = 10
        return button
    }()

    private let scrollView = UIScrollView()

    // MARK: - Public Properties

    var controller: UIViewController?

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func loadUserPhoto(_ photoName: String) {
        profilePhotoImageView.image = UIImage(named: photoName)
        scrollView.addSubview(profilePhotoImageView)
        scrollView.addSubview(yourStoryLabel)
        scrollView.addSubview(addStoryButtont)
    }

    func loadStories(_ storiesMap: [StatusOfStory: [Story]]) {
        var isProfileStory = false
        setScrollViewConstraints()
        if profilePhotoImageView.image != nil {
            setAddProfileStoryConstraints()
        } else {
            isProfileStory = true
        }

        let numberOfStories = (storiesMap[.isViewed]?.count ?? 0) + (storiesMap[.isNotViewed]?.count ?? 0) +
            (storiesMap[.profileStory]?.count ?? 0)
        var currentStoryNumber = 0
        for (status, stories) in storiesMap.sorted(by: { $0.key.rawValue > $1.key.rawValue }) {
            for story in stories {
                guard let controller = controller else { return }
                let storyView = StoryView(
                    avatarName: story.photoName,
                    description: story.description,
                    status: status,
                    controller: controller
                )
                storyView.translatesAutoresizingMaskIntoConstraints = false
                scrollView.addSubview(storyView)
                setConstraintsForStory(storyView, currentStoryNumber, numberOfStories, isProfileStory)
                currentStoryNumber += 1
            }
        }
    }

    // MARK: - Private Methods

    private func createView() {
        contentView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        contentView.addSubview(scrollView)
    }

    private func setConstraintsForStory(
        _ storyView: StoryView,
        _ currentStoryNumber: Int,
        _ numberOfStories: Int,
        _ isProfileStory: Bool
    ) {
        switch isProfileStory {
        case true where currentStoryNumber == 0:
            storyView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        case true:
            storyView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: CGFloat(Int(currentStoryNumber) * Constants.storyWithSpasingWeight)
            ).isActive = true
        case false:
            storyView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: CGFloat(94 + Int(currentStoryNumber) * Constants.storyWithSpasingWeight)
            ).isActive = true
        }
        storyView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 2).isActive = true
        storyView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        storyView.widthAnchor.constraint(equalToConstant: 74).isActive = true
        if currentStoryNumber == numberOfStories - 1 {
            storyView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        }
    }

    private func setAddProfileStoryConstraints() {
        profilePhotoImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12).isActive = true
        profilePhotoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 4).isActive = true
        profilePhotoImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        profilePhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        profilePhotoImageView.widthAnchor.constraint(equalTo: profilePhotoImageView.heightAnchor).isActive = true

        yourStoryLabel.centerXAnchor.constraint(equalTo: profilePhotoImageView.centerXAnchor).isActive = true
        yourStoryLabel.topAnchor.constraint(equalTo: profilePhotoImageView.bottomAnchor, constant: 5).isActive = true
        yourStoryLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        yourStoryLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true

        addStoryButtont.trailingAnchor.constraint(equalTo: profilePhotoImageView.trailingAnchor).isActive = true
        addStoryButtont.bottomAnchor.constraint(equalTo: profilePhotoImageView.bottomAnchor).isActive = true
        addStoryButtont.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addStoryButtont.widthAnchor.constraint(equalTo: addStoryButtont.heightAnchor).isActive = true
    }

    private func setScrollViewConstraints() {
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
