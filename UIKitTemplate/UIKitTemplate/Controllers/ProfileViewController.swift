// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        /// Текст для названия вкладки вью
        static let viewTitleName = "Профиль"
    }

    // MARK: - Private Properties

    let profileInfoViewController = ProfileInfoViewController()

    private lazy var profileView = ProfileView()

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
    }

    // MARK: - Private Methods

    private func configureController() {
        title = Constants.viewTitleName
        navigationItem.backButtonTitle = ""
        profileView.delegate = self
    }
}

extension ProfileViewController: ProfileButtonsActionDelegate {
    func myInfoButtonAction() {
        navigationController?.pushViewController(profileInfoViewController, animated: true)
    }
}
