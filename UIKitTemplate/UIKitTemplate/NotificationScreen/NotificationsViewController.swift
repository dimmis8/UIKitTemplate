// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран уведомлений
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let viewTitleText = "Уведомления"
    }

    // MARK: - Private Properties

    private lazy var notificationView = NotificationView()

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = notificationView
        configureNavigationItem()
    }

    private func configureNavigationItem() {
        let titleView: UILabel = {
            let label = UILabel()
            label.text = Constants.viewTitleText
            label.font = .init(name: "Verdana-Bold", size: 22)
            return label
        }()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
    }
}
