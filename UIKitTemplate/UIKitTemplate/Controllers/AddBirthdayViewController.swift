// AddBirthdayViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для добавления новых дней рождений
class AddBirthdayViewController: UIViewController {
    private lazy var addBirthdayView = AddNewBirthdayView(frame: view.frame)

    override func loadView() {
        super.loadView()
        view = addBirthdayView
        addBirthdayView.delegate = self
    }
}

extension AddBirthdayViewController: CancelButtonDelegate {
    func cancelView() {
        dismiss(animated: true, completion: nil)
    }

    func presentAlert(alert: UIAlertController) {
        present(alert, animated: true)
    }
}
