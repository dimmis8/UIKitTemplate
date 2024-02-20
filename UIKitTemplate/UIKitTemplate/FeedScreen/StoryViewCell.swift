// StoryViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка сториз
final class StoryViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let yourStoryText = "Ваша история"
        static let storyWithSpasingWeight = 86
    }

    // MARK: - Visual Components

    private let profilePhoto: UIImageView = {
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

    func loadUserPhoto(_ photo: UIImage) {
        profilePhoto.image = photo
    }

    func loadStories(_ storiesMap: [ViewingStatus: [Story]]) {
        let numberOfStories = (storiesMap[.isViewed]?.count ?? 0) + (storiesMap[.isNotViewed]?.count ?? 0)
        var currentStoryNumber = 0
        for (status, stories) in storiesMap.sorted(by: { $0.key.rawValue > $1.key.rawValue }) {
            for story in stories {
                let imageView: UIImageView = {
                    let imageView = UIImageView()
                    imageView.contentMode = .scaleAspectFill
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    imageView.layer.cornerRadius = 30
                    imageView.clipsToBounds = true
                    imageView.image = story.photo
                    return imageView
                }()

                let label: UILabel = {
                    let label = UILabel()
                    label.translatesAutoresizingMaskIntoConstraints = false
                    label.text = story.nickname
                    label.font = .init(name: "Verdana", size: 8)
                    label.textAlignment = .center
                    return label
                }()

                scrollView.addSubview(imageView)
                scrollView.addSubview(label)

                imageView.leadingAnchor.constraint(
                    equalTo: scrollView.leadingAnchor,
                    constant: CGFloat(94 + Int(currentStoryNumber) * Constants.storyWithSpasingWeight)
                ).isActive = true
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 2).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
                imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true

                label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
                label.heightAnchor.constraint(equalToConstant: 10).isActive = true
                label.widthAnchor.constraint(equalToConstant: 74).isActive = true

                if status == .isNotViewed {
                    let borderView: UIImageView = {
                        let borderView = UIImageView()
                        borderView.contentMode = .scaleAspectFill
                        borderView.translatesAutoresizingMaskIntoConstraints = false
                        borderView.image = .newStory
                        return borderView
                    }()
                    scrollView.addSubview(borderView)
                    borderView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
                    borderView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true

                    borderView.heightAnchor.constraint(equalToConstant: 63).isActive = true
                    borderView.widthAnchor.constraint(equalToConstant: 63).isActive = true
                }

                if currentStoryNumber == numberOfStories - 1 {
                    imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
                    print(currentStoryNumber)
                }
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
        scrollView.addSubview(profilePhoto)
        scrollView.addSubview(yourStoryLabel)
        scrollView.addSubview(addStoryButtont)
    }

    private func setConstraints() {
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        profilePhoto.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12).isActive = true
        profilePhoto.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 2).isActive = true
        profilePhoto.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        profilePhoto.heightAnchor.constraint(equalToConstant: 60).isActive = true
        profilePhoto.widthAnchor.constraint(equalTo: profilePhoto.heightAnchor).isActive = true

        yourStoryLabel.centerXAnchor.constraint(equalTo: profilePhoto.centerXAnchor).isActive = true
        yourStoryLabel.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 5).isActive = true
        yourStoryLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        yourStoryLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true

        addStoryButtont.trailingAnchor.constraint(equalTo: profilePhoto.trailingAnchor).isActive = true
        addStoryButtont.bottomAnchor.constraint(equalTo: profilePhoto.bottomAnchor).isActive = true
        addStoryButtont.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addStoryButtont.widthAnchor.constraint(equalTo: addStoryButtont.heightAnchor).isActive = true
    }
}
