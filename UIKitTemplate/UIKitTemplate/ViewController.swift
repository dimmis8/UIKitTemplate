// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
class ViewController: UIViewController {
    override func loadView() {
        super.loadView()
        view.addSubview(HomeView(frame: view.frame))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlertForName()
    }

    private func showAlertForName() {
        let alertControllerForName = UIAlertController(
            title: "Пожалуйста представьтесь",
            message: nil,
            preferredStyle: .alert
        )
        let actionOk = UIAlertAction(title: "Готово", style: .default) { _ in
            (self.view.subviews.first as? HomeView)?
                .createGreet(forName: alertControllerForName.textFields?.first?.text)
        }

        alertControllerForName.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }
        alertControllerForName.addAction(actionOk)

        present(alertControllerForName, animated: true)
    }
}
