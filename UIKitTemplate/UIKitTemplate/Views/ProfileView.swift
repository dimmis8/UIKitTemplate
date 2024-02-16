// ProfileView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол делегата действий кнопок экрана профиля
protocol ProfileButtonsActionDelegate: AnyObject {
    /// Функция передачи экшена кнопки "Мои данные"
    func myInfoButtonAction()
}

/// Экран профиля
final class ProfileView: UIView {
    // MARK: - Constants

    enum Constants {
        /// Величина скидки дисконтной карты
        static let discontAmount = "15%"
        /// Номер дисконтной карты
        static let discontCardNumber = "1000 0001 0102"
        /// Текст лейбла персональных данных
        static let personalInfoLabelText = "Личные данные"
        /// Текст для кнопки "Мои данные"
        static let myInfoButtonText = "  Мои данные"
        /// Текст для кнопки "Приведи друга"
        static let shareButtonText = "  Приведи друга"
        /// Текст для кнопки фидбека
        static let feedbackButtonText = "  Обратная связь"
    }

    // MARK: - Visual Components

    private let discontCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 20
        view.layer.shadowColor = CGColor(gray: 0, alpha: 0.25)
        view.layer.shadowOpacity = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()

    private let cardLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .logoCard
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let qrView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundQR
        view.layer.cornerRadius = 15
        return view
    }()

    private let infoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundQR
        view.layer.cornerRadius = 15
        return view
    }()

    private let qrImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .qr
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .info
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let discontAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.discontAmount
        label.font = .init(name: "Verdana-Bold", size: 16)
        label.textColor = .white
        return label
    }()

    private let discontCardNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.discontCardNumber
        label.font = .init(name: "Verdana", size: 14)
        label.textColor = .white
        return label
    }()

    private let personalInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.personalInfoLabelText
        label.font = .init(name: "Verdana-Bold", size: 16)
        return label
    }()

    private lazy var myInfoButton = createButton(withImage: .myInfo, title: Constants.myInfoButtonText)
    private lazy var shareButton = createButton(withImage: .share, title: Constants.shareButtonText)
    private lazy var feedbackButton = createButton(withImage: .feedback, title: Constants.feedbackButtonText)

    // MARK: - Public Properties

    weak var delegate: ProfileButtonsActionDelegate?

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
        addSubview(discontCard)
        discontCard.addSubview(cardLogoImageView)
        discontCard.addSubview(qrView)
        qrView.addSubview(qrImageView)
        discontCard.addSubview(infoView)
        infoView.addSubview(infoImageView)
        discontCard.addSubview(discontAmountLabel)
        discontCard.addSubview(discontCardNumberLabel)
        addSubview(personalInfoLabel)
        addSubview(myInfoButton)
        addSubview(shareButton)
        addSubview(feedbackButton)

        createConstraintsForSubviews()
    }

    private func createButton(withImage image: UIImage, title: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .init(name: "Verdana", size: 16)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(actionForButton(button:)), for: .touchUpInside)
        return button
    }

    private func createConstraintsForSubviews() {
        // констрейнты дисконтной карты
        discontCard.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        discontCard.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 23).isActive = true
        discontCard.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
            .isActive = true
        discontCard.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
            .isActive = true
        discontCard.heightAnchor.constraint(equalToConstant: 180).isActive = true
        // констрейнты лого дисконтной карты
        cardLogoImageView.leadingAnchor.constraint(equalTo: discontCard.leadingAnchor, constant: 8).isActive = true
        cardLogoImageView.topAnchor.constraint(equalTo: discontCard.topAnchor, constant: 16).isActive = true
        cardLogoImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        cardLogoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        // констрейнты для фона qr
        qrView.topAnchor.constraint(equalTo: discontCard.topAnchor, constant: 13).isActive = true
        qrView.trailingAnchor.constraint(equalTo: discontCard.trailingAnchor, constant: -13).isActive = true
        qrView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        qrView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        // констрейнты для qr
        qrImageView.centerXAnchor.constraint(equalTo: qrView.centerXAnchor).isActive = true
        qrImageView.centerYAnchor.constraint(equalTo: qrView.centerYAnchor).isActive = true
        qrImageView.widthAnchor.constraint(equalToConstant: 15.28).isActive = true
        qrImageView.heightAnchor.constraint(equalToConstant: 15.28).isActive = true
        // констрейнты для фона info
        infoView.bottomAnchor.constraint(equalTo: discontCard.bottomAnchor, constant: -20).isActive = true
        infoView.trailingAnchor.constraint(equalTo: discontCard.trailingAnchor, constant: -13).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        infoView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        // констрейнты для info
        infoImageView.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        infoImageView.centerYAnchor.constraint(equalTo: infoView.centerYAnchor).isActive = true
        infoImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        infoImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        // констрейнты для лейбла скидки карты
        discontAmountLabel.leadingAnchor.constraint(equalTo: discontCard.leadingAnchor, constant: 14)
            .isActive = true
        discontAmountLabel.topAnchor.constraint(equalTo: cardLogoImageView.bottomAnchor, constant: 20).isActive = true
        discontAmountLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        discontAmountLabel.widthAnchor.constraint(equalToConstant: 44).isActive = true
        // констрейнты для лейбла номера карты
        discontCardNumberLabel.leadingAnchor.constraint(equalTo: discontCard.leadingAnchor, constant: 14)
            .isActive = true
        discontCardNumberLabel.topAnchor.constraint(equalTo: discontAmountLabel.bottomAnchor, constant: 7)
            .isActive = true
        discontCardNumberLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        discontCardNumberLabel.widthAnchor.constraint(equalToConstant: 118).isActive = true
        // констрейнты для лейбла Личных данных
        personalInfoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
            .isActive = true
        personalInfoLabel.topAnchor.constraint(equalTo: discontCard.bottomAnchor, constant: 20).isActive = true
        personalInfoLabel.widthAnchor.constraint(equalToConstant: 163).isActive = true
        personalInfoLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        createConstraintAndLine(forButton: myInfoButton, numberOfCurrentButton: 1)
        createConstraintAndLine(forButton: shareButton, numberOfCurrentButton: 2)
        createConstraintAndLine(forButton: feedbackButton, numberOfCurrentButton: 3)
    }

    private func createConstraintAndLine(forButton button: UIButton, numberOfCurrentButton: CGFloat) {
        button.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        button.bottomAnchor.constraint(equalTo: personalInfoLabel.bottomAnchor, constant: 50 * numberOfCurrentButton)
            .isActive = true
        button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        let lineView = UIView()
        button.addSubview(lineView)
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.1)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    @objc func actionForButton(button: UIButton) {
        if button == myInfoButton {
            delegate?.myInfoButtonAction()
        }
    }
}
