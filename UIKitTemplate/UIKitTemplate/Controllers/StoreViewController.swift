// StoreViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран магазина
final class StoreViewController: UIViewController {
    // MARK: - Visual Components

    lazy var storeView = StoreView()

    // MARK: - Public Properties

    var cart: ShopingCartViewContoller?

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = storeView
    }
}

/// Подписание на делегат для передачи удаленного товара
extension StoreViewController: ShopingCartDelegate {
    func reloadCartInformation(deletedItem: StoreItem) {}
}
