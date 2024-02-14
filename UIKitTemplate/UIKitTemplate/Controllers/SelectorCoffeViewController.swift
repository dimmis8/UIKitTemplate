// SelectorCoffeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбора кофе

final class SelectorCoffeViewController: UIViewController {
    // MARK: - Constants

    private enum Constant {
        static let shareText = "Лови промокод roadmaplove на любой напиток из Кофейнов"
    }

    // MARK: - Public Properties

    var chodenCoffe = CoffieAndAdditives()
    var chosenRoast: RoastOfCoffe = .dark
    lazy var shareViewController = UIActivityViewController(
        activityItems: [Constant.shareText],
        applicationActivities: nil
    )

    // MARK: - Private Properties

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
        giveDelegateToSelectorCoffeView()
    }

    // MARK: - Public Methods

    func reloadRoastOfCoffe(withRoast chosenRoast: RoastOfCoffe) {
        self.chosenRoast = chosenRoast
        selectorCoffeView.reloadRoastButton(withRoast: chosenRoast)
    }

    func reloadAdditiviewsButton(additivesIsChosen: Bool) {
        selectorCoffeView.reloadAdditives(isAdditionChoosen: additivesIsChosen)
        selectorCoffeView.reloadPriceLabel(sum: chodenCoffe.calculateSum())
    }

    // MARK: - Private Methods

    private func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: selectorCoffeView.leftNavBarButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: selectorCoffeView.rightNavBarButton)
    }

    private func giveDelegateToSelectorCoffeView() {
        selectorCoffeView.delegate = self
    }
}

/// Подписание на делегат вью для выбора действия при нажатии на кнопки
extension SelectorCoffeViewController: SelectorCoffeDelegate {
    func backButton() {
        navigationController?.popViewController(animated: true)
    }

    func shareButton() {
        present(shareViewController, animated: true)
    }

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
        selectorCoffeView.reloadPriceLabel(sum: chodenCoffe.calculateSum())
    }

    func roastButtonAction() {
        let choseRoastViewController = ChoseRoastViewController()
        choseRoastViewController.selectorCoffeViewController = self
        choseRoastViewController.chosenRoast = chosenRoast
        present(choseRoastViewController, animated: true)
    }

    func aditivesButtonAction() {
        let chooseAdditivesViewController = ChooseAdditivesViewController(chosenAdditives: chodenCoffe.selectedAditives)
        chooseAdditivesViewController.selectorCoffeViewController = self
        present(chooseAdditivesViewController, animated: true)
    }

    func makeOrderButtonAction() {
        let checkViewController = CheckViewController()
        checkViewController.coffieAndAddivities = chodenCoffe
        present(checkViewController, animated: true)

    }
}
