// ProfilePostsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с постами профиля
final class ProfilePostsViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let profilePostViewCellIdentifier = "ProfilePostViewCell"
        static let cellsSpasing = 1.5
    }

    // MARK: - Visual Components

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())

    // MARK: - Private Properties

    private var posts: [String] = []

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func setPosts(_ posts: [String]) {
        self.posts = posts
        createView()
        setConstraints()
    }

    // MARK: - Private Methods

    private func createView() {
        backgroundColor = .lightGray
        collectionView.dataSource = self
        collectionView.delegate = self
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.register(
            ProfilePostViewCell.self,
            forCellWithReuseIdentifier: Constants.profilePostViewCellIdentifier
        )
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset.top = 14
        layout.minimumLineSpacing = Constants.cellsSpasing
        layout.minimumInteritemSpacing = Constants.cellsSpasing
        layout.scrollDirection = .vertical
        return layout
    }

    private func setConstraints() {
        collectionView.heightAnchor
            .constraint(equalToConstant: CGFloat(Int(UIScreen.main.bounds.width) / 3 * (posts.count / 3)))
            .isActive = true
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

// MARK: - Подписание на делегата колекшн вью для расчета размера ячеек

extension ProfilePostsViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let cellWidth = (frame.width - Constants.cellsSpasing * 2) / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }
}

// MARK: - Подписание на дата сорс колекшен вью

extension ProfilePostsViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.profilePostViewCellIdentifier,
            for: indexPath
        ) as? ProfilePostViewCell else { return UICollectionViewCell() }
        cell.setPost(posts[indexPath.item])
        return cell
    }
}
