// StoreViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран магазина
final class StoreViewController: UIViewController {
    lazy var storeView = StoreView()
    var cart: ShopingCartViewContoller?

    override func loadView() {
        super.loadView()
        view = storeView
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Каталог"
//    }
}

extension StoreViewController: ShopingCartDelegate {
    func reloadCartInformation(deletedItem: StoreItem) {}
}
