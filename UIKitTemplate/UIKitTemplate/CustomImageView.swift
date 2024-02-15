// CustomImageView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  asddadw
final class CustomImageView: UIImageView {
    convenience init(image: UIImage) {
        self.init()
        self.image = image
        layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4
        layer.masksToBounds = false
    }
}
