// RMLinkTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Таб бар контроллер приложения
final class RMLinkTabBarController: UITabBarController {
    // MARK: - Constants

    enum Constants {
        static let titleFeed = "Лента"
        static let titleNotification = "Уведомления"
        static let titleProfile = "Профиль"
    }

    // MARK: - Visual Components

    let feedViewController = FeedViewController()
    let notificationsViewController = NotificationsViewController()
    let profileViewController = ProfileViewController()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }

    // MARK: - Private Methods

    private func createTabBar() {
        let feedNavController = UINavigationController(rootViewController: feedViewController)
        let notificationCartNavController = UINavigationController(rootViewController: notificationsViewController)
        let profileNavController = UINavigationController(rootViewController: profileViewController)

        setViewControllers(
            [feedNavController, notificationCartNavController, profileNavController],
            animated: true
        )
        feedNavController.tabBarItem = UITabBarItem(
            title: Constants.titleFeed,
            image: .feedIcon,
            selectedImage: .feedIcon
        )
        notificationCartNavController.tabBarItem = UITabBarItem(
            title: Constants.titleNotification,
            image: .notificationIcon,
            selectedImage: .notificationIcon
        )
        profileNavController.tabBarItem = UITabBarItem(
            title: Constants.titleProfile,
            image: .profileIcon,
            selectedImage: .profileIcon
        )
        tabBar.tintColor = .selectedTitle
        tabBar.unselectedItemTintColor = .black
    }
}
