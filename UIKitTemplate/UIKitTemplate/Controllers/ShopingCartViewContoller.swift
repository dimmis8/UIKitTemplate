// ShopingCartViewContoller.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol ShopingCartDelegate: AnyObject {
    func reloadCartInformation(deletedItem: StoreItem)
}

/// Экран корзины
final class ShopingCartViewContoller: UIViewController {
    // MARK: - Constants

    enum Constants {
        /// Текст для названия вкладки вью
        static let viewTitleName = "Корзина"
    }

    // MARK: - Public Properties

    var cartMap: [StoreItem: Int] = [
        StoreItem(name: "Имя ботинка", itemImage: .blaachShoes, coast: 3000, size: 35): 1,
        StoreItem(name: "имяяяя", itemImage: .blackChose, coast: 1300, size: 36): 1
    ]
    weak var delegate: ShopingCartDelegate?
    lazy var shopingCartView = ShopingCartView(frame: view.frame, withItems: cartMap)

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = shopingCartView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    // MARK: - Public Methods

    func addItemToCart(item: StoreItem) {
        cartMap.updateValue(1, forKey: item)
        shopingCartView.reloadView(withItems: cartMap)
    }

    // MARK: - Private Methods

    private func configureView() {
        title = Constants.viewTitleName
        shopingCartView.delegate = self
    }
}

extension ShopingCartViewContoller: CountOfItemDelegate {
    func changeItemSize(forItem item: StoreItem, newSize: Int) {}

    func changeItemCount(ofItem item: StoreItem, count: Int) {
        cartMap.updateValue(count, forKey: item)
        if count == 0 {
            delegate?.reloadCartInformation(deletedItem: item)
            cartMap.removeValue(forKey: item)
        }
        shopingCartView.reloadView(withItems: cartMap)
    }
}
