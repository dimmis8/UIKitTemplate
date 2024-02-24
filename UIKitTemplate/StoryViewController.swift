// StoryViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран истории
final class StoryViewController: UIViewController {
    // MARK: - Visual Components

    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var storyImage: UIImage?
    private var progressView = UIProgressView()
    var progress = 0.0

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    // MARK: - Private Methods

    private func configureView() {
        let storyImageView = UIImageView(image: storyImage)
        storyImageView.contentMode = .scaleAspectFill
        storyImageView.clipsToBounds = true
        storyImageView.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.isHidden = true
        view.addSubview(storyImageView)
        view.addSubview(closeButton)
        createProgress(progressView)
        createTimer()
        closeButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)

        storyImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        storyImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        storyImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        storyImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true

        closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22)
            .isActive = true
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 14).isActive = true

        progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5)
            .isActive = true
        progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5)
            .isActive = true
        progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    private func createProgress(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x, y: view.center.y, width: 150, height: 50)
        progressView.setProgress(0.0, animated: false)
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .white
        progressView.trackTintColor = .lightGray
        progressView.center = view.center
    }

    private func createTimer() {
        let timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(updateProgressView),
            userInfo: nil,
            repeats: true
        )
    }

    @objc func updateProgressView() {
        progress += 0.001
        if progress >= 1 {
            dismiss(animated: true)
            navigationController?.popViewController(animated: true)
        }
        progressView.setProgress(Float(progress), animated: true)
    }

    @objc private func closeAction() {
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
}
