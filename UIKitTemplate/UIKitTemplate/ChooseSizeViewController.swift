// ChooseSizeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol SizeDelegate: AnyObject {
    func sendSize(size: Int)
}

/// adwd2eaw
final class ChooseSizeViewController: UIViewController {
    weak var delegate: SizeDelegate?

    enum Constants {
        static let xmarkImage = "xmark"
        static let titleText = "Выберете размер"
        static let nameFont = "Verdana-Bold"
        static let newItemsLabelSize = 16
    }

    lazy var sizeSelection = [35, 36, 37, 38, 39]
    private lazy var cancelViewButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.xmarkImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancelViewController), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()

    private let setSizeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleText
        label.font = UIFont(name: Constants.nameFont, size: CGFloat(Constants.newItemsLabelSize))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
        setupView()
        setupConstraint()
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(cancelViewButton)
        view.addSubview(setSizeLabel)
    }

    private func setupConstraint() {
        cancelViewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 26).isActive = true
        cancelViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        setSizeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        setSizeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 11).isActive = true
    }

    private func addButton() {
        var topAnchorButton: CGFloat = 77
        var topAnchorLine: CGFloat = 103
        for index in 0 ..< sizeSelection.count {
            let button = UIButton()
            let lineView = UIView()
            lineView.backgroundColor = .systemGray3
            lineView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(lineView)
            button.setTitle("\(sizeSelection[index]) EU", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.tag = index
            button.titleLabel?.textAlignment = .left
            button.addTarget(self, action: #selector(setSize(sender:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: topAnchorButton).isActive = true
            button.heightAnchor.constraint(equalToConstant: 20).isActive = true

            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            lineView.topAnchor.constraint(equalTo: view.topAnchor, constant: topAnchorLine).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
            topAnchorButton += 37
            topAnchorLine += 37
        }
    }

    @objc private func setSize(sender: UIButton) {
        delegate?.sendSize(size: sizeSelection[sender.tag])
        dismiss(animated: true)
    }

    @objc private func cancelViewController() {
        dismiss(animated: true)
    }
}
