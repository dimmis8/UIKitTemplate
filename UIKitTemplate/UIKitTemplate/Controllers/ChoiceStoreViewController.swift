// ChoiceStoreViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// gcfvghjvjh
class ChoiceStoreViewController: UIViewController {
    var selectedItem = StoreItem(name: "Черные туфли", imageName: .blackSandal, coast: 2250, size: 39)
    var blackSandalStoreItem = StoreItem(name: "Черные туфли", imageName: .blackSandal, coast: 2250, size: 39)
    var blackBootStoreItem = StoreItem(name: "Черные ботинки", imageName: .blaachShoes, coast: 4250, size: 39)
    var redSneakerCellStoreItem = StoreItem(name: "Розовые кросовки", imageName: .gradSneakers, coast: 5750, size: 39)
    var yellowSandalStoreItem = StoreItem(name: "Желтые туфли", imageName: .yellowSandal, coast: 3500, size: 39)
    var whiteSneakerStoreItem = StoreItem(name: "Белые кросовки", imageName: .sneakersWhite, coast: 5750, size: 39)
    lazy var allCellStroreItem: [StoreItem] = [
        blackSandalStoreItem,
        blackBootStoreItem,
        redSneakerCellStoreItem,
        yellowSandalStoreItem,
        whiteSneakerStoreItem
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStore()
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupStore()
    }

    private func setupView() {
        view.backgroundColor = .white
    }

    private func setupStore() {
        var top: CGFloat = 130
        var left: CGFloat = 20
        for index in 0 ..< allCellStroreItem.count {
            let cellItemsView = CellItemsView()
            cellItemsView.basketButton.addTarget(self, action: #selector(addBasket(button:)), for: .touchUpInside)
            cellItemsView.basketButton.tag = index
            cellItemsView.translatesAutoresizingMaskIntoConstraints = false
            cellItemsView.nameImageView.image = allCellStroreItem[index].imageName
            cellItemsView.nameLabel.text = "\(allCellStroreItem[index].coast) ₽"
            view.addSubview(cellItemsView)
            cellItemsView.widthAnchor.constraint(equalToConstant: view.bounds.width / 2.3).isActive = true
            cellItemsView.heightAnchor.constraint(equalTo: cellItemsView.widthAnchor).isActive = true
            if index % 2 == 0 {
                cellItemsView.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
                cellItemsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: left).isActive = true
                left += 178
            } else {
                cellItemsView.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
                cellItemsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: left).isActive = true
                left -= 178
                top += 173
            }
        }
    }

    @objc private func addBasket(button: UIButton) {
        let chooseSizeViewController = ChooseSizeViewController()
        chooseSizeViewController.delegate = self
        present(chooseSizeViewController, animated: true)
    }
}

extension ChoiceStoreViewController: SizeDelegate {
    func sendSize(size: Int) {
        selectedItem.size = size
        let shopingCartViewContoller = ShopingCartViewContoller()
        shopingCartViewContoller.cartMap = [selectedItem: 1]
    }
}
