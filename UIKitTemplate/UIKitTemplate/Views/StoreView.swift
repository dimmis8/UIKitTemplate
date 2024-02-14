// StoreView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью экрана магазина
final class StoreView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func loadView() {
        backgroundColor = .white
    }
}
