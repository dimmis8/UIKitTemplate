// ShopingCartView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью экрана корзины
class ShopingCartView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func loadView() {
        backgroundColor = .gray
    }
}
