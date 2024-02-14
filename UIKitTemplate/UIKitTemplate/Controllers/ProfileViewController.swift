// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
final class ProfileViewController: UIViewController {
    
    // MARK: - Constants
    enum Constants {
        static let viewTitleName = "Профиль"
    }
    
    
    lazy var profileView = ProfileView()

    override func loadView() {
        super.loadView()
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.viewTitleName
    }
}
