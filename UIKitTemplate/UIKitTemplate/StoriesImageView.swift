// StoriesImageView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Кастомное Имадж Вью для более удобной настройки установлено закругление и тень
final class StoriesImageView: UIImageView {
    // MARK: - Initializers

    convenience init(image: UIImage) {
        self.init()
        self.image = image
        layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 7
        layer.masksToBounds = false
    }
}
