// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

//
//  SceneDelegate.swift
//  UIKitTemplate
//
//  Created by Дмитрий Логвинов on 05.02.2024.
//

import UIKit

/// Scene Delegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        let viewController = AutorizationViewController()
        viewController.view.backgroundColor = .white
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
