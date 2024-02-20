// FeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран ленты
final class FeedViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let storyViewCellIdentifier = "StoryViewCell"
        static let recomendationViewCellIdentifier = "RecomendationViewCell"
        static let postViewCellIdentifier = "PostViewCell"
    }

    // MARK: - Private Properties

    private let contentType: [ContentType] = [.stories, .firstPost, .recommendations, .posts]
    private let sourceOfInformation = SourceOfInformation()

    private let tableView = UITableView()
    private lazy var feedView = FeedView()
    private var refreshControl: UIRefreshControl {
        let refrash = UIRefreshControl()
        refrash.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        return refrash
    }

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = feedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureTableView()
    }

    // MARK: - Private Properties

    private func configureNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIImageView(image: .rmLinkLogo))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIImageView(image: .massageIcon))
    }

    private func configureTableView() {
        tableView.register(StoryViewCell.self, forCellReuseIdentifier: Constants.storyViewCellIdentifier)
        tableView.register(
            RecomendationViewCell.self,
            forCellReuseIdentifier: Constants.recomendationViewCellIdentifier
        )
        tableView.register(
            UINib(nibName: Constants.postViewCellIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.postViewCellIdentifier
        )
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.separatorStyle = .none

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        tableView.addSubview(refreshControl)
    }

    @objc private func handleRefresh(_ sender: UIRefreshControl) {
        tableView.backgroundColor = .white
        sender.endRefreshing()
    }
}

// MARK: - Добавление типа контента

extension FeedViewController {
    /// Тип контента
    enum ContentType {
        /// Истории
        case stories
        /// Первый пост
        case firstPost
        /// Рекомендации
        case recommendations
        /// Остальные посты
        case posts
    }
}

// MARK: - Подписание на дата сорс тейбл вью

extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        contentType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch contentType[section] {
        case .stories, .firstPost, .recommendations:
            return 1
        case .posts:
            return sourceOfInformation.getPosts().count - 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contentType[indexPath.section] {
        case .stories:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: Constants.storyViewCellIdentifier,
                    for: indexPath
                ) as? StoryViewCell
            else { return UITableViewCell() }
            cell.loadStories(sourceOfInformation.getStories())
            cell.loadUserPhoto(sourceOfInformation.getUserProfilePhoto())
            return cell
        case .firstPost:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: Constants.postViewCellIdentifier, for: indexPath) as? PostViewCell
            else { return UITableViewCell() }
            cell.loadPost(sourceOfInformation.getPosts()[indexPath.row])
            cell.loadUserPhoto(sourceOfInformation.getUserProfilePhoto())
            return cell
        case .posts:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: Constants.postViewCellIdentifier, for: indexPath) as? PostViewCell
            else { return UITableViewCell() }
            cell.loadPost(sourceOfInformation.getPosts()[indexPath.row + 1])
            cell.loadUserPhoto(sourceOfInformation.getUserProfilePhoto())
            return cell
        case .recommendations:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: Constants.recomendationViewCellIdentifier,
                    for: indexPath
                ) as? RecomendationViewCell
            else { return UITableViewCell() }
            cell.loadRecomendation(sourceOfInformation.getRecomendations())
            return cell
        }
    }
}
