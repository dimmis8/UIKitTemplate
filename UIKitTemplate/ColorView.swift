// ColorView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью с цветом светофора
final class ColorView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
}
