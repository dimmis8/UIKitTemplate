// StackConstraintsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с стеквью
final class StackConstraintsViewController: UIViewController {
    // MARK: - Visual Components

    private let greenView: ColorView = {
        let greenView = ColorView()
        greenView.backgroundColor = .green
        return greenView
    }()

    private let yellowView: ColorView = {
        let yellowView = ColorView()
        yellowView.backgroundColor = .yellow
        return yellowView
    }()

    private let redView: ColorView = {
        let redView = ColorView()
        redView.backgroundColor = .red
        return redView
    }()

    private let grayView: UIView = {
        let grayView = UIView()
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.backgroundColor = .darkGray
        return grayView
    }()

    // MARK: - Private Properties
    
    private var stackView = UIStackView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        createConstraints()
    }


    // MARK: - Private Methods

    private func configureViews() {
        stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        view.addSubview(grayView)
        grayView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func createConstraints() {
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 410).isActive = true
        let heightEqualSuperviewConstraint = stackView.heightAnchor.constraint(
            equalTo: view.heightAnchor,
            multiplier: 0.8
        )
        heightEqualSuperviewConstraint.priority = .defaultLow
        heightEqualSuperviewConstraint.isActive = true
        stackView.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.34146).isActive = true

        grayView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        grayView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        grayView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 5).isActive = true
        grayView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5).isActive = true
    }
}
