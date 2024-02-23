// ProfilePostViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с постом
final class ProfilePostViewCell: UICollectionViewCell {
    // MARK: - Visual Components

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .earth
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func setPost(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
    }

    // MARK: - Private Methods

    private func createView() {
        backgroundColor = .white
        contentView.addSubview(imageView)
    }

    private func setConstraints() {
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
