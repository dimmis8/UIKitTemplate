// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol MuveToFirstDelegate: AnyObject {
    func goBack()
}

///  Контроллер вью чека
final class CheckViewController: UIViewController {
    // MARK: - Visual Components

    private let leftCornerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "left")
        image.frame = CGRect(x: 20, y: 47, width: 100, height: 73)
        image.sizeToFit()
        return image
    }()

    private let rightCornerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "right")
        image.frame = CGRect(x: 260, y: 47, width: 100, height: 73)
        image.sizeToFit()
        return image
    }()

    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gravira")
        image.frame = CGRect(x: 145, y: 472, width: 100, height: 40)
        image.sizeToFit()
        return image
    }()

    private let yourOrderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.frame = CGRect(x: 120, y: 100, width: 175, height: 19)
        label.text = "Вашъ Заказъ"
        return label
    }()

    private let praceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.frame = CGRect(x: 80, y: 433, width: 231, height: 30)
        label.textAlignment = .center
        label.text = "Цѣна - 100 руб"
        return label
    }()

    private lazy var sellButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оплатить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        button.backgroundColor = UIColor(red: 89.0 / 255.0, green: 190.0 / 255.0, blue: 199.0 / 255.0, alpha: 0.3)
        button.layer.cornerRadius = 12
        button.frame = CGRect(x: 20, y: 632, width: 345, height: 53)
        button.addTarget(self, action: #selector(sellComform), for: .touchUpInside)
        return button
    }()

    private let currentCoffeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 155, width: 150, height: 30)
        label.text = "Americano"
        return label
    }()

    private let praceCoffeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.frame = CGRect(x: 225, y: 155, width: 130, height: 30)
        label.textAlignment = .right
        label.text = "Цѣна - 100 руб"
        return label
    }()

    private lazy var cancellationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        button.addTarget(self, action: #selector(cancellationView), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()

    // MARK: - Public Properties

    weak var delegate: MuveToFirstDelegate?
    var coffieAndAddivities = CoffieAndAdditives()

    // MARK: - Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupCheckView()
        additives()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupCheckView() {
        praceLabel.text = "Цѣна - \(coffieAndAddivities.sum()) руб"
        currentCoffeLabel.text = coffieAndAddivities.discriptionCoffie
        praceCoffeLabel.text = "\(coffieAndAddivities.coffie.rawValue) руб"
    }

    private func additives() {
        var yFrame = 191
        guard !coffieAndAddivities.selectedAditives.isEmpty else { return }
        for value in coffieAndAddivities.selectedAditives {
            let leftLabel = UILabel(frame: CGRect(x: 20, y: yFrame, width: 150, height: 30))
            let rightLabel = UILabel(frame: CGRect(x: 225, y: yFrame, width: 130, height: 30))
            leftLabel.font = UIFont(name: "Verdana", size: 16)
            rightLabel.font = UIFont(name: "Verdana", size: 16)
            rightLabel.textAlignment = .right
            leftLabel.text = value
            rightLabel.text = "\(coffieAndAddivities.aditives[value] ?? 0) руб"
            view.addSubview(leftLabel)
            view.addSubview(rightLabel)
            yFrame += 36
        }
    }

    private func setupUI() {
        [
            praceLabel,
            currentCoffeLabel,
            praceLabel,
            sellButton,
            rightCornerImage,
            leftCornerImage,
            iconImage,
            yourOrderLabel,
            praceCoffeLabel,
            cancellationButton
        ].forEach { view.addSubview($0) }
        view.backgroundColor = .white
    }

    @objc private func sellComform() {
        let newViewController = ThanksViewController()
        newViewController.delegate = self
        present(newViewController, animated: true, completion: nil)
    }

    @objc private func cancellationView() {
        dismiss(animated: true)
    }
}

extension CheckViewController: MuveToFirstDelegate {
    func goBack() {
        if let navigVC = presentingViewController as? UINavigationController {
            view.isHidden = true
            dismiss(animated: false)
            navigVC.popViewController(animated: false)
        }

        dismiss(animated: true)
        delegate?.goBack()
    }
}
