// ChoiceStoreViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// 'Экран выбраной категори товара в магазине'
class ChoiceStoreViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let textTitle = "Обувь"
        static let startYTop = 130
        static let startYLeft = 5
        static let stepX = 178
        static let stepY = 173
        static let ratioWight = 2.2
        static let ratioHeiht = 2.4
    }

    var cart: ShopingCartViewContoller?

    // MARK: - Private Properties

    private var selectedItem = StoreItem(name: "Белые кросовки", itemImage: .sneakersWhite, coast: 5750)
    private var blackSandalStoreItem = StoreItem(name: "Черные туфли", itemImage: .blackSandal, coast: 2250)
    private var blackBootStoreItem = StoreItem(name: "Черные ботинки", itemImage: .blaachShoes, coast: 4250)
    private var redSneakerCellStoreItem = StoreItem(
        name: "Розовые кросовки",
        itemImage: .gradSneakers,
        coast: 5750
    )
    private var yellowSandalStoreItem = StoreItem(name: "Желтые туфли", itemImage: .yellowSandal, coast: 3500)
    private var whiteSneakerStoreItem = StoreItem(name: "Белые кросовки", itemImage: .whiteShoes, coast: 5750)
    private lazy var allCellStroreItem: [StoreItem] = [
        blackSandalStoreItem,
        blackBootStoreItem,
        redSneakerCellStoreItem,
        yellowSandalStoreItem,
        whiteSneakerStoreItem
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createStore()
        configureView()
    }

    // MARK: - Private Methods

    private func configureView() {
        view.backgroundColor = .white
        title = Constants.textTitle
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
    }

    private func createStore() {
        var top = CGFloat(Constants.startYTop)
        var left = CGFloat(Constants.startYLeft)
        for index in 0 ..< allCellStroreItem.count {
            let cellItemsView = CellItemsView()
            cellItemsView.basketButton.addTarget(self, action: #selector(addBasket(button:)), for: .touchUpInside)
            cellItemsView.basketButton.tag = index
            cellItemsView.translatesAutoresizingMaskIntoConstraints = false
            cellItemsView.nameImageView.image = allCellStroreItem[index].itemImage
            cellItemsView.layer.cornerRadius = 20
            cellItemsView.nameLabel.text = "\(allCellStroreItem[index].coast) ₽"
            view.addSubview(cellItemsView)
            cellItemsView.widthAnchor.constraint(equalToConstant: view.bounds.width / Constants.ratioWight)
                .isActive = true
            cellItemsView.heightAnchor.constraint(equalToConstant: view.bounds.width / Constants.ratioHeiht)
                .isActive = true
            if index % 2 == 0 {
                cellItemsView.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
                cellItemsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: left).isActive = true
                left += CGFloat(Constants.stepX)
            } else {
                cellItemsView.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
                cellItemsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: left).isActive = true
                left -= CGFloat(Constants.stepX)
                top += CGFloat(Constants.stepY)
            }
        }
    }

    @objc private func addBasket(button: UIButton) {
        selectedItem = allCellStroreItem[button.tag]
        button.setImage(.redBasket, for: .normal)
        button.isEnabled = false
        let chooseSizeViewController = ChooseSizeViewController()
        chooseSizeViewController.delegate = self
        present(chooseSizeViewController, animated: true)
    }
}

// MARK: - Extension

/// Подписываемся на делега экрна выбора размера
extension ChoiceStoreViewController: SizeDelegate {
    /// добавление в корзину элемента
    /// - Parameters:
    ///    - size: размер обуви
    func sendSize(size: Int) {
        cart?.delegate = self
        cart?.addItemToCart(item: selectedItem, size: size)
    }
}

// MARK: - Extension

/// Подписываемся на делегат корзины
extension ChoiceStoreViewController: ShopingCartDelegate {
    /// изменение картинки корзины кнопки
    /// - Parameters:
    ///    - deletedItem: принимаемый параметр экзнмпляр StoreItem
    func reloadCartInformation(deletedItem: StoreItem) {
        for (index, item) in allCellStroreItem.enumerated() where item.name == deletedItem.name {
            if let button = view.viewWithTag(index) as? UIButton {
                button.setImage(.grayBasket, for: .normal)
                button.isEnabled = true
            }
        }
    }
}
