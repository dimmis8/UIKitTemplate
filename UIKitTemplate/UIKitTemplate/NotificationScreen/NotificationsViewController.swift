// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран уведомлений
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let viewTitleText = "Уведомления"
        static let requestLabelText = "Запросы на подписку"
        static let notificationViewCellIdentifier = "NotificationViewCell"
        static let todayHeader = "Сегодня"
        static let thisWeekHeader = "На этой неделе"
    }

    // MARK: - Visual Components

    let requestLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.requestLabelText
        label.font = .init(name: "Verdana", size: 14)
        return label
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(name: "Verdana-Bold", size: 17)
        label.textColor = .black
        return label
    }()

    private let notificationsGroups: [NotificationsGroups] = [.today, .thisWeek]
    private let tableView = UITableView()
    private let notificationView = NotificationView()
    private var refreshControl: UIRefreshControl {
        let refrash = UIRefreshControl()
        refrash.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        return refrash
    }

    // MARK: - Private Properties

    private var sourceOfInformation = SourceOfInformation()

    // MARK: - Life Cycle

    override func loadView() {
        view = notificationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        addLabelRequests()
        configureTableView()
    }

    // MARK: - Private Methods

    private func configureNavigationItem() {
        let titleView: UILabel = {
            let label = UILabel()
            label.text = Constants.viewTitleText
            label.font = .init(name: "Verdana-Bold", size: 22)
            return label
        }()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
    }

    private func addLabelRequests() {
        view.addSubview(requestLabel)
        requestLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14)
            .isActive = true
        requestLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        requestLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        requestLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
    }

    private func configureTableView() {
        tableView.register(NotificationViewCell.self, forCellReuseIdentifier: Constants.notificationViewCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.separatorStyle = .none

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        tableView.addSubview(refreshControl)
    }

    @objc private func handleRefresh(_ sender: UIRefreshControl) {
        tableView.backgroundColor = .white
        sender.endRefreshing()
    }
}

// MARK: - Подписание на дата сорс тейбл вью

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        notificationsGroups.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch notificationsGroups[section] {
        case .today:
            sourceOfInformation.getGroupedNotifications()[.today]?.count ?? 0
        case .thisWeek:
            sourceOfInformation.getGroupedNotifications()[.thisWeek]?.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.notificationViewCellIdentifier,
            for: indexPath
        ) as? NotificationViewCell else { return UITableViewCell() }

        guard let notification = sourceOfInformation
            .getGroupedNotifications()[notificationsGroups[indexPath.section]]?[indexPath.row]
        else { return UITableViewCell() }

        cell.loadNotification(notification)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch notificationsGroups[section] {
        case .today:
            Constants.todayHeader
        case .thisWeek:
            Constants.thisWeekHeader
        }
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        sourceOfInformation.notifications[notificationsGroups[indexPath.section]]?.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}

// MARK: - Подписание на делегат тейбл вью

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch notificationsGroups[section] {
        case .today:
            headerLabel.text = Constants.todayHeader
        case .thisWeek:
            headerLabel.text = Constants.thisWeekHeader
        }
        let headerView = UIView()
        headerView.backgroundColor = .white
        headerView.addSubview(headerLabel)

        headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 12).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return headerView
    }
}
