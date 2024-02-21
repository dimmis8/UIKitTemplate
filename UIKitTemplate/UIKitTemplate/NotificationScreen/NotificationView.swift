// NotificationView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью уведомлений
final class NotificationView: UIView {
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
