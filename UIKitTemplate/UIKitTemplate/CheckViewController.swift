// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// контроллер с чеками
class CheckViewController: UIViewController {
    let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)

    @IBAction func pay(_ sender: Any) {
        let alert = UIAlertController(title: "Вы хотите оплатить чек?", message: nil, preferredStyle: .alert)
        let actionCheck = UIAlertAction(title: "Да", style: .default) { _ in
            let nextViewController = self.storyboardInstance
                .instantiateViewController(withIdentifier: "thanksViewController")
            self.present(nextViewController, animated: true)
        }
        let actionClose = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(actionCheck)
        alert.addAction(actionClose)
        present(alert, animated: true)
    }
}
