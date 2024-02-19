// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var profileView = ProfileView()

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = profileView
    }
}
