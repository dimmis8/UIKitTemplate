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

    var cartMap: [StoreItem: Int] = [:]
    weak var delegate: ShopingCartDelegate?
    lazy var shopingCartView = ShopingCartView()

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = shopingCartView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewTitle()
    }

    // MARK: - Public Methods

    func addItemToCart(item: StoreItem) {}

    // MARK: - Private Methods

    private func setupViewTitle() {
        title = Constants.viewTitleName
    }
}
