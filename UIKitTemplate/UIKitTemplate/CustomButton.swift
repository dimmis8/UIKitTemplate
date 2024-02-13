// CustomButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// кастомная кнопка для 2 го вью контроллера
class CustomButton: UIButton {
    convenience init(name: String, nameImage: String, right: Int, frame: CGRect) {
        self.init(frame: frame)
        layer.cornerRadius = 16
        setTitle(name, for: .normal)
        setImage(UIImage(named: nameImage), for: .normal)
        titleLabel?.font = UIFont(name: "Verdana-BoldItalic", size: 16)
        setTitleColor(UIColor.black, for: .normal)
        contentHorizontalAlignment = .right
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: CGFloat(right))
        semanticContentAttribute = .forceRightToLeft
        backgroundColor = UIColor(red: 225.0 / 255.0, green: 194.0 / 255.0, blue: 160.0 / 255.0, alpha: 0.7)
    }
}
