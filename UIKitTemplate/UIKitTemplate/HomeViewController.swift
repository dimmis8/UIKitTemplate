// HomeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// HomeController
final class HomeViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var homeView = HomeView(frame: view.frame, isHomeView: true)

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view.addSubview(homeView)
        homeView.delegate = self
    }

    // MARK: - Private Methods

    private func updateInformation(withWord text: String?) {
        view.subviews.first?.removeFromSuperview()
        view.addSubview(HomeView(frame: view.frame, isHomeView: false))
        (view.subviews.last as? HomeView)?.delegate = self
        (view.subviews.last as? HomeView)?.createViewWithLabel(
            enteredWord: text,
            reversedWord: ReverseModel().reverce(text)
        )
    }
}

// MARK: - AlertDelegate

extension HomeViewController: AlertDelegate {
    func showAlert() {
        let alert = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        let actionResolve = UIAlertAction(title: "Ok", style: .default) { _ in
            self.updateInformation(withWord: alert.textFields?.first?.text)
        }
        alert.addTextField()
        alert.addAction(actionResolve)
        present(alert, animated: true)
    }
}
