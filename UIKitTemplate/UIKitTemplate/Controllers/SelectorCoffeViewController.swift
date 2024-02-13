// SelectorCoffeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер вью выбора кофе
class SelectorCoffeViewController: UIViewController {
    var but = UIButton(frame: CGRect(x: 50, y: 300, width: 50, height: 50))
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        but.backgroundColor = .orange
        view.addSubview(but)
        but.addTarget(self, action: #selector(awdawd), for: .touchUpInside)
    }

    @objc func awdawd() {
        let secinVC = CheckViewController()
        present(secinVC, animated: true)
    }
}
