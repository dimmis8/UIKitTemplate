// ChoseRoastViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер экрана выбора прожарки зерен
final class ChoseRoastViewController: UIViewController {
    // MARK: - Public Properties

    /// Прожарка кофе
    var chosenRoast: RoastOfCoffe? {
        didSet {
            selectorCoffeViewController?.reloadRoastOfCoffe(withRoast: chosenRoast ?? .dark)
        }
    }

    /// Ссылка на контроллер экрана выбора кофе
    weak var selectorCoffeViewController: SelectorCoffeViewController?

    // MARK: - Private Properties

    /// Вью экрана выбора прожарки зерен кофе
    private lazy var chooseRoastOfCoffeView = ChooseRoastOfCoffeView(frame: view.frame)

    // MARK: - loadView

    override func loadView() {
        super.loadView()
        view = chooseRoastOfCoffeView
    }

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        chooseRoastOfCoffeView.delegate = self
        if chosenRoast == .light {
            lightRoastButtoAction()
        }
    }
}

/// Подписание на делегат передачи таргетов вью выбора прожарки кофе
extension ChoseRoastViewController: ChooseRoastDelegate {
    /// Функция обработки нажатия кнопки темной прожарки кофе
    func darkRoastButtonAction() {
        chooseRoastOfCoffeView.darkRoastButton.layer.borderColor = CGColor(
            red: 89 / 255,
            green: 190 / 255,
            blue: 199 / 255,
            alpha: 1
        )
        chooseRoastOfCoffeView.lightRoastButton.layer.borderColor = CGColor(gray: 0, alpha: 0)
        chosenRoast = .dark
    }

    /// Функция обработки нажатия кнопки светлой прожарки кофе
    func lightRoastButtoAction() {
        chooseRoastOfCoffeView.lightRoastButton.layer.borderColor = CGColor(
            red: 89 / 255,
            green: 190 / 255,
            blue: 199 / 255,
            alpha: 1
        )
        chooseRoastOfCoffeView.darkRoastButton.layer.borderColor = CGColor(gray: 0, alpha: 0)
        chosenRoast = .light
    }

    /// Функция обработки нажатия кнопки закрытия экрана
    func closeView() {
        dismiss(animated: true)
    }
}
