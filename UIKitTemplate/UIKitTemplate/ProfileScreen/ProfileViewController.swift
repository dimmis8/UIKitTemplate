// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let profileViewCellIdentifier = "ProfileViewCell"
        static let storyViewCellIdentifier = "StoryViewCell"
        static let profilePostsViewCellIdentifier = "ProfilePostsViewCell"
    }

    // MARK: - Visual Components

    private let titleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(name: "Verdana-Bold", size: 22)
        return label
    }()

    private let lockImageView = UIImageView(image: .lock)
    private let plusImageView = UIImageView(image: .calendarPlus)
    private let listImageView = UIImageView(image: .list)
    private let tableView = UITableView()
    private let profileView = ProfileView()
    private var refreshControl: UIRefreshControl {
        let refrash = UIRefreshControl()
        refrash.addTarget(self, action: #selector(refreshHandle(_:)), for: .valueChanged)
        return refrash
    }

    // MARK: - Private Properties

    private let contentTypes: [ContentTypes] = [.profileInfo, .profileStories, .profileImages]
    private let sourceOfProfileInfo = SourceOfProfileInfo()

    // MARK: - Life Cycle

    override func loadView() {
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        hidesBottomBarWhenPushed = true
    }

    // MARK: - Private Methods

    private func configureTableView() {
        tableView.register(ProfileViewCell.self, forCellReuseIdentifier: Constants.profileViewCellIdentifier)
        tableView.register(StoriesViewCell.self, forCellReuseIdentifier: Constants.storyViewCellIdentifier)
        tableView.register(ProfilePostsViewCell.self, forCellReuseIdentifier: Constants.profilePostsViewCellIdentifier)
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

    private func configureNavigationItem() {
        let leftBarView = UIView()
        let rightBarView = UIView()
        leftBarView.addSubview(lockImageView)
        leftBarView.addSubview(titleView)
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        listImageView.translatesAutoresizingMaskIntoConstraints = false
        rightBarView.addSubview(plusImageView)
        rightBarView.addSubview(listImageView)
        titleView.text = sourceOfProfileInfo.getUserProfileInfo().nickName
        titleView.leadingAnchor.constraint(equalTo: lockImageView.trailingAnchor).isActive = true
        titleView.centerYAnchor.constraint(equalTo: lockImageView.centerYAnchor).isActive = true
        listImageView.trailingAnchor.constraint(equalTo: rightBarView.trailingAnchor).isActive = true
        plusImageView.trailingAnchor.constraint(equalTo: listImageView.leadingAnchor, constant: -3).isActive = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarView)
    }

    private func openBrowser(link: String?) {
        let browser = BrowserViewController()
        browser.link = link
        navigationController?.pushViewController(browser, animated: true)
    }

    @objc private func refreshHandle(_ sender: UIRefreshControl) {
        tableView.backgroundColor = .white
        sender.endRefreshing()
    }
}

// MARK: - Добавление групп информации на странице профиля

extension ProfileViewController {
    enum ContentTypes {
        /// Информация о профиле
        case profileInfo
        /// Истории профиля
        case profileStories
        /// Фото профиля
        case profileImages
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        contentTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contentTypes[indexPath.section] {
        case .profileInfo:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.profileViewCellIdentifier,
                for: indexPath
            ) as? ProfileViewCell else { return UITableViewCell() }
            cell.setProfileInfo(sourceOfProfileInfo.getUserProfileInfo())
            cell.discriptionButtonComplitionHandler = openBrowser
            return cell
        case .profileStories:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: Constants.storyViewCellIdentifier,
                    for: indexPath
                ) as? StoriesViewCell
            else { return UITableViewCell() }
            cell.loadStories(sourceOfProfileInfo.getStories())
            return cell
        case .profileImages:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: Constants.profilePostsViewCellIdentifier,
                    for: indexPath
                ) as? ProfilePostsViewCell
            else { return UITableViewCell() }
            cell.setPosts(sourceOfProfileInfo.getPosts())
            return cell
        }
    }
}
