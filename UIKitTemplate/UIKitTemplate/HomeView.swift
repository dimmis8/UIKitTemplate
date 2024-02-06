// HomeView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью домашней страницы
class HomeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
        createButtons()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createView() {
        let backgroundImageView = UIImageView(image: UIImage(named: "bacgroundImage"))
        backgroundImageView.frame = frame(forAlignmentRect: CGRect(x: 0, y: 37, width: 375, height: 775))
        addSubview(backgroundImageView)
    }

    private func createButtons() {
        let buttonGuessTheNumber = UIButton(frame: CGRect(
            origin: CGPoint(x: 82, y: 302),
            size: CGSize(width: 150, height: 150)
        ))
        buttonGuessTheNumber.layer.cornerRadius = 30
        buttonGuessTheNumber.backgroundColor = UIColor(red: 155 / 255, green: 127 / 255, blue: 181 / 255, alpha: 1)
        buttonGuessTheNumber.layer.borderWidth = 3
        buttonGuessTheNumber.layer.borderColor = CGColor(red: 76 / 255, green: 36 / 255, blue: 115 / 255, alpha: 1)
        buttonGuessTheNumber.setTitle("Угадай число", for: .normal)
        buttonGuessTheNumber.titleLabel?.font = .boldSystemFont(ofSize: 25)
        buttonGuessTheNumber.titleLabel?.numberOfLines = 2
        buttonGuessTheNumber.titleLabel?.textAlignment = .center
        addSubview(buttonGuessTheNumber)

        let buttonCalculator = UIButton(frame: CGRect(
            origin: CGPoint(x: 132, y: 507),
            size: CGSize(width: 200, height: 200)
        ))
        buttonCalculator.layer.cornerRadius = 30
        buttonCalculator.backgroundColor = UIColor(red: 100 / 255, green: 181 / 255, blue: 131 / 255, alpha: 1)
        buttonCalculator.layer.borderWidth = 3
        buttonCalculator.layer.borderColor = CGColor(red: 59 / 255, green: 105 / 255, blue: 76 / 255, alpha: 1)
        buttonCalculator.setTitle("Калькулятор", for: .normal)
        buttonCalculator.titleLabel?.font = .boldSystemFont(ofSize: 25)
        buttonCalculator.titleLabel?.textAlignment = .center
        addSubview(buttonCalculator)
    }
}
