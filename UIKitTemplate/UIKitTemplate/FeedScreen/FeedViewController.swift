// FeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран ленты
final class FeedViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var feedView = FeedView()

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = feedView
        configureNavigationItem()
    }

    private func configureNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIImageView(image: .rmLinkLogo))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIImageView(image: .massageIcon))
    }
}
