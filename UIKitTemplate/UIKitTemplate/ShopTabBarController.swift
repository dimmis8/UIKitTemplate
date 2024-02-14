// ShopTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Таб бар контроллер приложения
class ShopTabBarController: UITabBarController {
    // MARK: - Constants

    enum Constants {
        static let titleStore = "Каталог"
        static let titleCart = "Корзина"
        static let titleProfile = "Профиль"
    }

    // MARK: - Visual Components

    let storeViewController = StoreViewController()
    let shopingCartViewContoller = ShopingCartViewContoller()
    let profileViewController = ProfileViewController()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
        storeViewController.cart = shopingCartViewContoller as? ShopingCartDelegate
    }

    // MARK: - Private Methods

    private func createTabBar() {
        let storeNavController = UINavigationController(rootViewController: storeViewController)
        let profileNavController = UINavigationController(rootViewController: profileViewController)

        storeNavController.title = Constants.titleStore
        shopingCartViewContoller.title = Constants.titleCart
        profileNavController.title = Constants.titleProfile

        setViewControllers(
            [storeNavController, shopingCartViewContoller, profileNavController],
            animated: true
        )
    }
}
