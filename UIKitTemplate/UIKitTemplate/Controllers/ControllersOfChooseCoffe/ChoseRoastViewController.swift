// ChoseRoastViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбора прожарки зерен
final class ChoseRoastViewController: UIViewController {
    // MARK: - Constants

    private enum Colors {
        /// Цвет обводки для выбранной обжарки
        static let borderColor = CGColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 1)
    }

    // MARK: - Public Properties

    var chosenRoast: RoastOfCoffe? {
        didSet {
            selectorCoffeViewController?.reloadRoastOfCoffe(withRoast: chosenRoast ?? .dark)
        }
    }

    weak var selectorCoffeViewController: SelectorCoffeViewController?

    // MARK: - Private Properties

    private lazy var chooseRoastOfCoffeView = ChooseRoastOfCoffeView(frame: view.frame)

    // MARK: - loadView

    override func loadView() {
        super.loadView()
        view = chooseRoastOfCoffeView
    }

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        selectRoast()
    }

    // MARK: - Private Methods

    private func selectRoast() {
        chooseRoastOfCoffeView.delegate = self
        if chosenRoast == .light {
            lightRoastButtoAction()
        }
    }
}

/// Подписание на делегат передачи таргетов вью выбора прожарки кофе
extension ChoseRoastViewController: ChooseRoastDelegate {
    func darkRoastButtonAction() {
        chooseRoastOfCoffeView.darkRoastButton.layer.borderColor = Colors.borderColor
        chooseRoastOfCoffeView.lightRoastButton.layer.borderColor = CGColor(gray: 0, alpha: 0)
        chosenRoast = .dark
        print("yes")
    }

    func lightRoastButtoAction() {
        chooseRoastOfCoffeView.lightRoastButton.layer.borderColor = Colors.borderColor
        chooseRoastOfCoffeView.darkRoastButton.layer.borderColor = CGColor(gray: 0, alpha: 0)
        chosenRoast = .light
    }

    func closeView() {
        dismiss(animated: true)
    }
}
