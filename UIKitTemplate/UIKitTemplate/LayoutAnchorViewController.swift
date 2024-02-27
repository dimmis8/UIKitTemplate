// LayoutAnchorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с LayoutAnchor
final class LayoutAnchorViewController: UIViewController {
    // MARK: - Visual Components

    private let greenView: ColorView = {
        let greenView = ColorView()
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = .green
        return greenView
    }()

    private let yellowView: ColorView = {
        let yellowView = ColorView()
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.backgroundColor = .yellow
        return yellowView
    }()

    private let redView: ColorView = {
        let redView = ColorView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = .red
        return redView
    }()

    private let grayView: UIView = {
        let grayView = UIView()
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.backgroundColor = .darkGray
        return grayView
    }()
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        createConstraints()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        redView.layer.cornerRadius = 130 / 2
        yellowView.layer.cornerRadius = 130 / 2
        greenView.layer.cornerRadius = 130 / 2
    }

    // MARK: - Private Methods

    private func configureViews() {
        view.addSubview(grayView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
    }

    private func createConstraints() {
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.heightAnchor.constraint(lessThanOrEqualToConstant: 130).isActive = true
        let heightEqualSuperviewConstraint = yellowView.heightAnchor.constraint(
            equalTo: view.heightAnchor,
            multiplier: 0.25
        )
        heightEqualSuperviewConstraint.priority = .defaultLow
        heightEqualSuperviewConstraint.isActive = true
        yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true

        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: greenView.heightAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 5).isActive = true

        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -5).isActive = true

        grayView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        grayView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        grayView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 5).isActive = true
        grayView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 5).isActive = true
    }
}
