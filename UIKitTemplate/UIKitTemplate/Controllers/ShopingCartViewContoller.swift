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

    var cartMap: [StoreItem: [Characteristics: Int]] = [:]
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

    func addItemToCart(item: StoreItem, size: Int) {
        cartMap.updateValue([.count: 1, .size: size], forKey: item)
        shopingCartView.reloadView(withItems: cartMap)
    }

    // MARK: - Private Methods

    private func configureView() {
        title = Constants.viewTitleName
        shopingCartView.delegate = self
    }
}

extension ShopingCartViewContoller: CountOfItemDelegate {
    func changeItemSize(forItem item: StoreItem, newSize: Int) {
        let count = cartMap[item]?[.count] ?? 0
        cartMap.updateValue([.count: count, .size: newSize], forKey: item)
    }

    func changeItemCount(ofItem item: StoreItem, count: Int) {
        let size = cartMap[item]?[.size] ?? 0
        cartMap.updateValue([.count: count, .size: size], forKey: item)
        if count == 0 {
            delegate?.reloadCartInformation(deletedItem: item)
            cartMap.removeValue(forKey: item)
        }
        shopingCartView.reloadView(withItems: cartMap)
    }
}
