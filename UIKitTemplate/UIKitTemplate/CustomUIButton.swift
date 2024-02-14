// CustomUIButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомная кнопка для главного экрана и экрана выбора прожарки зерен
struct CustomUIButton {
    /// Метод для создания новой кнопки со своим изображением, лейблом и позицией
    /// - Parameters:
    ///   - withImageName: имя изображения для кнопки
    ///   - labelText: текст лейбла кнопки
    ///   - position: позиция размещения кнопки
    /// - Returns: Кнопка
    func createButton(withImageName imageName: String, labelText: String, position: CGPoint) -> UIButton {
        let button = UIButton(frame: CGRect(origin: position, size: CGSize(width: 165, height: 165)))
        let imageView = {
            let imageView = UIImageView(frame: CGRect(x: 31, y: 17, width: 100, height: 100))
            imageView.image = UIImage(named: imageName)
            return imageView
        }()
        let labelView = {
            let labelView = UILabel(frame: CGRect(x: 0, y: 117, width: 165, height: 34))
            labelView.text = labelText
            labelView.textAlignment = .center
            labelView.numberOfLines = 2
            labelView.textColor = .black
            labelView.font = .init(name: "Verdana", size: 13)
            return labelView
        }()
        button.addSubview(imageView)
        button.addSubview(labelView)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "backgroundButtonColor")
        return button
    }
}
