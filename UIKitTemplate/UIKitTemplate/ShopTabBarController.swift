// ShopTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Таб бар контроллер приложения
final class ShopTabBarController: UITabBarController {
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
        storeViewController.cart = shopingCartViewContoller
    }

    // MARK: - Private Methods

    private func createTabBar() {
        let storeNavController = UINavigationController(rootViewController: storeViewController)
        let shopingCartNavController = UINavigationController(rootViewController: shopingCartViewContoller)
        let profileNavController = UINavigationController(rootViewController: profileViewController)

        setViewControllers(
            [storeNavController, shopingCartNavController, profileNavController],
            animated: true
        )
        storeNavController.tabBarItem = UITabBarItem(
            title: Constants.titleStore,
            image: .one,
            selectedImage: .selectOne
        )
        shopingCartNavController.tabBarItem = UITabBarItem(
            title: Constants.titleCart,
            image: .two,
            selectedImage: .selectTwo
        )
        profileNavController.tabBarItem = UITabBarItem(
            title: Constants.titleProfile,
            image: .there,
            selectedImage: .selectedThere
        )
        tabBar.tintColor = .systemPink
        tabBar.unselectedItemTintColor = .black
    }
}
