// StoreView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран магазина
final class StoreView: UIView {
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func loadView() {
        backgroundColor = .white
    }
}
