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

    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        guard (scene as? UIWindowScene) != nil else { return }
    }
}
