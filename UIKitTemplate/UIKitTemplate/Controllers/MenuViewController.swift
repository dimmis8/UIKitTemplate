// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер экрана меню (делает коллега)
class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        createButtonForPush()
    }

    private func createButtonForPush() {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.setTitleColor(.green, for: .normal)
        button.setTitle("next", for: .normal)
        button.addTarget(self, action: #selector(pushSelectorCoffeViewController), for: .touchUpInside)

        view.addSubview(button)
    }

    @objc private func pushSelectorCoffeViewController() {
        let selectorCoffeViewController = SelectorCoffeViewController()
        navigationController?.pushViewController(selectorCoffeViewController, animated: true)
    }
}
