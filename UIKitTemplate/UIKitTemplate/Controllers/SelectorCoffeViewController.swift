// SelectorCoffeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер вью выбора кофе
final class SelectorCoffeViewController: UIViewController {
    // MARK: - Public Properties

    /// Текст для шеринга
    let shareText = "Лови промокод roadmaplove на любой напиток из Кофейнов"
    /// Выбранный кофе
    var chodenCoffe = CoffieAndAdditives()
    /// Выбранная прожарка
    var chosenRoast: RoastOfCoffe = .dark
    /// Вью контроллер меню шеринга
    lazy var shareViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)

    // MARK: - Private Properties

    /// Вью экрана выбора кофе
    private lazy var selectorCoffeView = SelectorCoffeView(frame: view.frame)

    // MARK: - loadView

    override func loadView() {
        super.loadView()
        view = selectorCoffeView
    }

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        selectorCoffeView.delegate = self
    }

    // MARK: - Public Methods

    /// Метод обновления прожарки кофе
    func reloadRoastOfCoffe(withRoast chosenRoast: RoastOfCoffe) {
        self.chosenRoast = chosenRoast
        selectorCoffeView.reloadRoastButton(withRoast: chosenRoast)
    }

    /// Метод обновления кнопки добавок кофе
    func reloadAdditiviewsButton(additivesIsChosen: Bool) {
        selectorCoffeView.reloadAdditives(isAdditionChoosen: additivesIsChosen)
        selectorCoffeView.reloadPriceLabel(sum: chodenCoffe.sum())
    }

    // MARK: - Private Methods

    /// Метод настройки навигейшн бара
    private func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: selectorCoffeView.leftNavBarButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: selectorCoffeView.rightNavBarButton)
    }
}

/// Подписание на делегат вью для выбора действия при нажатии на кнопки
extension SelectorCoffeViewController: SelectorCoffeDelegate {
    /// Функция обработки нажатия кнопки "назад"
    func backButton() {
        navigationController?.popViewController(animated: true)
    }

    /// Функция обработки нажатия кнопки "поделиться"
    func shareButton() {
        present(shareViewController, animated: true)
    }

    /// Функция обработки выбора сегмент контроллера с кофе
    /// - Parameters:
    ///   - state: номер состояния сегмент контроллера
    func segmentControllerChange(state: Int) {
        selectorCoffeView.reloadView(withState: state)
        switch state {
        case 0:
            chodenCoffe.coffie = .americano
        case 1:
            chodenCoffe.coffie = .cappuccino
        case 2:
            chodenCoffe.coffie = .latte
        default:
            break
        }
        selectorCoffeView.reloadPriceLabel(sum: chodenCoffe.sum())
    }

    /// Функция обработки нажатия кнопки выбора степени обжарки
    func roastButtonAction() {
        let choseRoastViewController = ChoseRoastViewController()
        choseRoastViewController.selectorCoffeViewController = self
        choseRoastViewController.chosenRoast = chosenRoast
        present(choseRoastViewController, animated: true)
    }

    /// Функция обработки нажатия кнопки выбора дополнений к кофе
    func aditivesButtonAction() {
        let chooseAdditivesViewController = ChooseAdditivesViewController(chosenAdditives: chodenCoffe.selectedAditives)
        chooseAdditivesViewController.selectorCoffeViewController = self
        present(chooseAdditivesViewController, animated: true)
    }

    /// Функция обработки нажатия кнопки "Заказать"
    func makeOrderButtonAction() {
        let checkViewController = CheckViewController()
        checkViewController.coffieAndAddivities = chodenCoffe
        present(checkViewController, animated: true)
    }
}
