// HomeView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol AlertDelegate: AnyObject {
    func showAlert()
}

/// класс домашней вью
class HomeView: UIView {
    // MARK: - Public Properties

    weak var delegate: AlertDelegate?
    private var positionOfButton = CGRect(x: 20, y: 406, width: 335, height: 44)
    var buttonStart: UIButton {
        let button = UIButton(frame: positionOfButton)
        button.backgroundColor = UIColor(red: 76 / 255, green: 216 / 255, blue: 102 / 255, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }

    // MARK: - Life Cycle

    init(frame: CGRect, isHomeView: Bool) {
        super.init(frame: frame)
        if isHomeView {
            createView()
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func createViewWithLabel(enteredWord: String?, reversedWord: String?) {
        positionOfButton = CGRect(x: 20, y: 598, width: 335, height: 44)
        createView()
        var titleText: UILabel {
            let title = UILabel(frame: CGRect(x: 50, y: 106, width: 275, height: 57))
            title.text = "Вы ввели слово"
            title.textAlignment = .center
            title.font = .boldSystemFont(ofSize: 20)
            return title
        }
        var enterText: UILabel {
            let title = UILabel(frame: CGRect(x: 50, y: 163, width: 275, height: 57))
            title.text = enteredWord
            title.textAlignment = .center
            title.font = .boldSystemFont(ofSize: 20)
            title.textColor = .gray
            return title
        }
        var titleReverse: UILabel {
            let title = UILabel(frame: CGRect(x: 50, y: 282, width: 275, height: 57))
            title.text = "А вот что получится, если читать справо налево"
            title.textAlignment = .center
            title.numberOfLines = 2
            title.font = .boldSystemFont(ofSize: 20)
            return title
        }
        var reversedText: UILabel {
            let title = UILabel(frame: CGRect(x: 50, y: 339, width: 275, height: 57))
            title.text = reversedWord
            title.textAlignment = .center
            title.font = .boldSystemFont(ofSize: 20)
            title.textColor = .gray
            return title
        }
        addSubview(titleText)
        addSubview(enterText)
        addSubview(titleReverse)
        addSubview(reversedText)
    }

    // MARK: - Private Methods

    private func createView() {
        backgroundColor = .white
        addSubview(buttonStart)
    }

    @objc private func showAlert() {
        delegate?.showAlert()
    }
}
