// HomeView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol CalculateDelegate: AnyObject {
    func calculate()
    func guessTheNumber()
}

/// Вью домашней страницы
final class HomeView: UIView {
    // MARK: - Public Properties

    weak var delegateCalculate: CalculateDelegate?

    var buttonGuessTheNumber: UIButton {
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
        buttonGuessTheNumber.addTarget(self, action: #selector(guessTheNumber), for: .touchUpInside)
        return buttonGuessTheNumber
    }

    var buttonCalculator: UIButton {
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
        buttonCalculator.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        return buttonCalculator
    }

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func createGreet(forName nameForGreet: String?) {
        guard let name = nameForGreet, !name.isEmpty else { return }
        let greetingLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 37), size: CGSize(width: 375, height: 82)))
        greetingLabel.backgroundColor = UIColor(red: 151 / 255, green: 203 / 255, blue: 229 / 255, alpha: 1)
        greetingLabel.layer.borderWidth = 3
        greetingLabel.layer.borderColor = CGColor(gray: 1, alpha: 0.8)
        greetingLabel.textAlignment = .center
        greetingLabel.numberOfLines = 2
        greetingLabel.font = .boldSystemFont(ofSize: 25)
        greetingLabel.text = "Приветствую, \n \(name.uppercased())!"
        addSubview(greetingLabel)
    }

    @objc func calculate() {
        delegateCalculate?.calculate()
    }

    @objc func guessTheNumber() {
        delegateCalculate?.guessTheNumber()
    }

    // MARK: - Private Methods

    private func createView() {
        let backgroundImageView = UIImageView(image: UIImage(named: "bacgroundImage"))
        backgroundImageView.frame = frame(forAlignmentRect: CGRect(x: 0, y: 37, width: 375, height: 775))
        addSubview(backgroundImageView)
        addSubview(buttonGuessTheNumber)
        addSubview(buttonCalculator)
    }
}
