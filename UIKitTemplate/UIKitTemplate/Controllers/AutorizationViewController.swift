// AutorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью контроллер экрана авторизации
final class AutorizationViewController: UIViewController {
    // MARK: - Private Properties
    private lazy var autorizationView = AutorizationView(frame: view.frame)

    // MARK: - loadView
    override func loadView() {
        super.loadView()
        view.addSubview(autorizationView)
        autorizationView.delegate = self
    }
}

/// Подписание на делегат кнопок экрана для передачи экшена перехода на следующий экран
extension AutorizationViewController: EnterButtonDelegate {
    func showNextView() {
        let birthdayListViewController = BirthdayListViewController()
        birthdayListViewController.view.backgroundColor = .white
        birthdayListViewController.title = "Birthday Reminder"
        navigationController?.pushViewController(birthdayListViewController, animated: true)
    }
}
