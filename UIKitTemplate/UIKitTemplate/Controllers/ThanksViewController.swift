// ThanksViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран успешного заказа
final class ThanksViewController: UIViewController {
    // MARK: - Constants

    enum Constant {
        static let nameCafeLabelText = "СПАСИБО \nЗА ЗАКАЗ"
        static let adressInfoLabelText = """
        Разскажи о насъ другу, отправь ему
        промокодъ
        на безплатный напитокъ и получи
        скидку 10% на слѣдующій заказъ.
        """
        static let returnBackButtonText = "Хорошо"
        static let xmarkImage = "xmark"
    }

    // MARK: - Public Properties

    weak var delegate: MuveToFirstDelegate?

    // MARK: - Visual Components

    private let wreathImage: UIImageView = {
        let image = UIImageView()
        image.image = .wraith
        image.frame = CGRect(x: 92, y: 58, width: 200, height: 86)
        return image
    }()

    private let nameCafeLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.nameCafeLabelText
        label.textAlignment = .center
        label.numberOfLines = 0
        label.frame = CGRect(x: 75, y: 184, width: 235, height: 128)
        label.font = UIFont(name: "AmaticSC-Bold", size: 50)
        label.textColor = .black
        return label
    }()

    private let adressInfoLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.adressInfoLabelText
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .gray
        label.frame = CGRect(x: 30, y: 362, width: 315, height: 89)
        label.font = UIFont(name: "Verdana", size: 16)
        return label
    }()

    private lazy var cancellationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constant.xmarkImage), for: .normal)
        button.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        button.addTarget(self, action: #selector(closeThanksScreen), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()

    private lazy var returnBackButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constant.returnBackButtonText, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        button.backgroundColor = UIColor(red: 89.0 / 255.0, green: 190.0 / 255.0, blue: 199.0 / 255.0, alpha: 1)
        button.layer.cornerRadius = 12
        button.frame = CGRect(x: 20, y: 632, width: 345, height: 53)
        button.addTarget(self, action: #selector(moveToMenuScreen), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.backgroundColor = .white
        [returnBackButton, cancellationButton, adressInfoLabel, nameCafeLabel, wreathImage]
            .forEach { view.addSubview($0) }
    }

    @objc private func closeThanksScreen() {
        dismisView()
    }

    @objc private func moveToMenuScreen() {
        delegate?.goBack()
        dismisView()
    }

    private func dismisView() {
        dismiss(animated: true)
    }
}
