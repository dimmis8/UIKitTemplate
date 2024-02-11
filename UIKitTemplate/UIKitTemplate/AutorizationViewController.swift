// AutorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью контроллер экрана авторизации
class AutorizationViewController: UIViewController {
    private lazy var autorizationView = AutorizationView(frame: view.frame)

    override func loadView() {
        super.loadView()
        view.addSubview(autorizationView)
    }
}
