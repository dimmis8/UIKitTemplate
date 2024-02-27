// StoryboardConstraintsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с констрейнтами из сториборда
final class StoryboardConstraintsViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var redView: UIView!
    @IBOutlet private var yellowView: UIView!
    @IBOutlet private var greenView: UIView!

    // MARK: - Life Cycle

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        redView.layer.cornerRadius = redView.bounds.height / 2
        yellowView.layer.cornerRadius = yellowView.frame.height / 2
        greenView.layer.cornerRadius = greenView.frame.height / 2
    }
}
