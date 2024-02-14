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

        setupWindowScene()
    }

    private func setupWindowScene() {
        let viewController = AutarizationViewController()
        /// Значение 255 обозначает максимально возможную интенсивность выбранного цвета в RGB-модели.
        viewController.view.backgroundColor = UIColor(
            red: 120.0 / 255.0,
            green: 84.0 / 255.0,
            blue: 49.0 / 255.0,
            alpha: 1
        )
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
