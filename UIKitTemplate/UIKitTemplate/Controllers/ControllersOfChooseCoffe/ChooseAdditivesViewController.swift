// ChooseAdditivesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбора добавок кофе
final class ChooseAdditivesViewController: UIViewController {
    // MARK: - Public Properties

    weak var selectorCoffeViewController: SelectorCoffeViewController?
    var chosenAdditives: [String] {
        didSet {
            selectorCoffeViewController?.chodenCoffe.selectedAditives = chosenAdditives
            selectorCoffeViewController?.reloadAdditiviewsButton(additivesIsChosen: !chosenAdditives.isEmpty)
        }
    }

    // MARK: - Private Properties

    private lazy var chooseAdditivesView = ChooseAdditivesView(frame: view.frame, choosenAdditives: chosenAdditives)

    // MARK: - Initializers

    init(chosenAdditives: [String]) {
        self.chosenAdditives = chosenAdditives
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - loadView

    override func loadView() {
        super.loadView()
        view = chooseAdditivesView
    }

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        chooseAdditivesView.delegate = self
    }
}

// Подписание на делегат вью выбора добавок для получения экшенов контрол-элементов
extension ChooseAdditivesViewController: ChooseAdditivesDelegate {
    func chooseAddition(addition: String, isAdd: Bool) {
        if isAdd {
            chosenAdditives.append(addition)
        } else {
            guard (chosenAdditives.contains { $0 == addition }) else { return }
            chosenAdditives.remove(at: chosenAdditives.firstIndex(of: addition) ?? Int())
        }
    }

    func closeView() {
        dismiss(animated: true)
    }
}
