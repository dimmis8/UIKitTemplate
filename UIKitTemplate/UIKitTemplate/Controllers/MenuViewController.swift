// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер экрана меню
final class MenuViewController: UIViewController {
    // MARK: - Visual Components

    private let nameCafeLabel: UILabel = {
        let label = UILabel()
        label.text = "Кофеиновъ"
        label.frame = CGRect(x: 100, y: 49, width: 175, height: 76)
        label.font = UIFont(name: "AmaticSC-Bold", size: 55)
        label.textColor = UIColor(red: 207 / 255.0, green: 180 / 255.0, blue: 150 / 255.0, alpha: 1)
        return label
    }()

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать, Гость"
        label.frame = CGRect(x: 20, y: 147, width: 185, height: 44)
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()

    private let avatarLabel: UILabel = {
        let label = UILabel()
        label.text = "Г"
        label.frame = CGRect(x: 311, y: 147, width: 44, height: 44)
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .white
        label.layer.cornerRadius = label.frame.size.width / 2
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 89 / 255.0, green: 190 / 255.0, blue: 199 / 255.0, alpha: 1)

        return label
    }()

    private let startView = MenuView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.backgroundColor = UIColor(
            red: 120.0 / 255.0,
            green: 84.0 / 255.0,
            blue: 49.0 / 255.0,
            alpha: 1
        )
        startView.frame = CGRect(x: 0, y: 248, width: 375, height: 564)
        startView.layer.cornerRadius = 20
        [startView, avatarLabel, welcomeLabel, nameCafeLabel].forEach { view.addSubview($0) }
        startView.coffeButton.addTarget(self, action: #selector(setCoffeCharge), for: .touchUpInside)
    }

    @objc private func setCoffeCharge() {
        let selectorCoffeVC = SelectorCoffeViewController()
        navigationController?.pushViewController(selectorCoffeVC, animated: true)
    }
}
