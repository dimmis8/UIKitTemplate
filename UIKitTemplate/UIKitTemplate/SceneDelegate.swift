// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

//
//  SceneDelegate.swift
//  UIKitTemplate
//
//  Created by Дмитрий Логвинов on 05.02.2024.
//
import UIKit

/// SceneDelegate class
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navController = UINavigationController()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        createRootViewController(windowScene)
    }

    private func createRootViewController(_ windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        let viewController = MenuViewController()
        navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
