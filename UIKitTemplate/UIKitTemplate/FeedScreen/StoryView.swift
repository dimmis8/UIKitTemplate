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

    private let imageButton: UIButton = {
        let imageButton = UIButton()
        imageButton.contentMode = .scaleAspectFill
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.layer.cornerRadius = 30
        imageButton.clipsToBounds = true
        return imageButton
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

    // MARK: - Public Properties

    var controller: UIViewController

    // MARK: - Initializers

    init(avatarName: String, description: String, status: StatusOfStory, controller: UIViewController) {
        self.controller = controller
        super.init(frame: CGRect())
        loadView(avatarName: avatarName, description: description, status: status)
        createConstraints()
    }

    required init?(coder: NSCoder) {
        controller = UIViewController()
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func loadView(avatarName: String, description: String, status: StatusOfStory) {
        imageButton.setImage(UIImage(named: avatarName), for: .normal)
        imageButton.imageView?.contentMode = .scaleAspectFill
        label.text = description
        addSubview(imageButton)
        addSubview(label)
        createStoryBorder(status)
        imageButton.addTarget(self, action: #selector(openStory(sender:)), for: .touchUpInside)
    }

    private func createConstraints() {
        imageButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageButton.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 60).isActive = true

        label.centerXAnchor.constraint(equalTo: imageButton.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 5).isActive = true
        label.heightAnchor.constraint(equalToConstant: 10).isActive = true
        label.widthAnchor.constraint(equalToConstant: 74).isActive = true
    }

    private func createStoryBorder(_ status: StatusOfStory) {
        addSubview(borderView)
        borderView.centerXAnchor.constraint(equalTo: imageButton.centerXAnchor).isActive = true
        borderView.centerYAnchor.constraint(equalTo: imageButton.centerYAnchor).isActive = true
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

    @objc private func openStory(sender: UIButton) {
        let storyViewvController = StoryViewController()
        let navigationController = UINavigationController(rootViewController: storyViewvController)
        storyViewvController.storyImage = sender.image(for: .normal)
        navigationController.modalPresentationStyle = .fullScreen
        controller.present(navigationController, animated: true, completion: nil)
        // controller.navigationController?.pushViewController(storyViewvController, animated: true)
        print(123)
    }
}
