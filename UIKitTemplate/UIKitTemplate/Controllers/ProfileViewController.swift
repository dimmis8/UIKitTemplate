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

    private lazy var profileView = ProfileView()

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewTitle()
    }

    // MARK: - Private Methods

    private func setupViewTitle() {
        title = Constants.viewTitleName
    }
}
