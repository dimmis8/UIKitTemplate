// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Private Properties

    private let profileView = ProfileView()

    // MARK: - Life Cycle

    override func loadView() {
        view = profileView
    }
}
