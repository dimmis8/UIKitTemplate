// BrowserViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран браузера
final class BrowserViewController: UIViewController {
    // MARK: - Public Properties

    var link: String?

    // MARK: - Visual Components

    private let webView = WKWebView()

    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let toolbar = UIToolbar()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        createConstraints()
        loadRequest()
    }

    // MARK: - Private Methods

    private func configureView() {
        view.backgroundColor = .black
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.isHidden = true
        webView.addSubview(closeButton)
        webView.addSubview(toolbar)
        closeButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)

        let backButtonItem = UIBarButtonItem(systemItem: .rewind)
        let forwardButtonItem = UIBarButtonItem(systemItem: .fastForward)
        let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
        let refreshButtonItem = UIBarButtonItem(systemItem: .refresh)
        toolbar.frame.size.width = 200
        toolbar.frame.size.height = 300
        toolbar.items = [backButtonItem, forwardButtonItem, spacer, refreshButtonItem]
        backButtonItem.action = #selector(backAction)
        forwardButtonItem.action = #selector(forwardAction)
        refreshButtonItem.action = #selector(refreshAction)
    }

    private func createConstraints() {
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22)
            .isActive = true
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 14).isActive = true

        toolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        toolbar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        toolbar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        toolbar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func loadRequest() {
        guard let link = link else { return }
        guard let url = URL(string: link) else { return }
        print("yes")
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    @objc private func closeAction() {
        navigationController?.viewControllers.first?.hidesBottomBarWhenPushed = false
        navigationController?.popViewController(animated: true)
    }

    @objc private func backAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }

    @objc private func refreshAction() {
        webView.reload()
    }

    @objc private func forwardAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }
}
