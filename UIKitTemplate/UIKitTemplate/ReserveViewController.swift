// ReserveViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// контроллер экрана с резервированием стола
final class ReserveViewController: UIViewController {
    // MARK: - Constants

    let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Public Methods

    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Выставить счёт?", message: nil, preferredStyle: .alert)
        let actionCheck = UIAlertAction(title: "Чек", style: .default) { _ in
            let nextViewController = self.storyboardInstance
                .instantiateViewController(withIdentifier: "checkVievController")
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        let actionClose = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(actionCheck)
        alert.addAction(actionClose)
        present(alert, animated: true)
    }
}
