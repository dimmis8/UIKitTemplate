// ShopingCartViewContoller.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol ShopingCartDelegate: AnyObject {
    func reloadCartInformation(deletedItem: StoreItem)
}

/// Экран корзины
final class ShopingCartViewContoller: UIViewController {
    lazy var shopingCartView = ShopingCartView()
    weak var delegate: ShopingCartDelegate?
    var cartMap: [StoreItem: [Characteristics: Int]] = [:]

    override func loadView() {
        super.loadView()
        view = shopingCartView
    }

    func addItemToCart(item: StoreItem, size: Int) {}

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Корзина"
    }
}
