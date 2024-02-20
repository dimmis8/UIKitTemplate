// PostViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с постом
final class PostViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let postWidth = 375
    }

    // MARK: - Private Properties

    private let scrollView = UIScrollView()
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .darkGray
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.hidesForSinglePage = true
        return pageControl
    }()

    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var userLoginLabel: UILabel!
    @IBOutlet private var optionImageView: UIImageView!
    @IBOutlet private var likeCountLabel: UILabel!
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var descriptionLabel: UILabel!

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        createView()
        setConstraints()
    }

    // MARK: - Public Methods

    func loadPost(_ post: Post) {
        pageControl.numberOfPages = post.photos.count
        avatarImageView.image = post.avatar
        userLoginLabel.text = post.nickname
        likeCountLabel.text = "Нравится: \(post.likesNumber)"
        let boldAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 11)]
        let attributedString = NSMutableAttributedString(string: post.nickname + ": " + post.description)
        attributedString.addAttributes(boldAttributes, range: NSRange(location: 0, length: post.nickname.count + 1))
        descriptionLabel.attributedText = attributedString

        var currentPhotoNumber = 0
        for photo in post.photos {
            let imageView = UIImageView()
            imageView.image = photo
            imageView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(imageView)

            imageView.heightAnchor.constraint(equalToConstant: 239).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 375).isActive = true
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            imageView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: CGFloat(currentPhotoNumber * Constants.postWidth)
            ).isActive = true

            if currentPhotoNumber == post.photos.count - 1 {
                imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
            }
            currentPhotoNumber += 1
        }
    }

    func loadUserPhoto(_ photo: UIImage) {
        userImageView.image = photo
    }

    // MARK: - Private Methods

    private func createView() {
        backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        contentView.addSubview(scrollView)
        contentView.addSubview(pageControl)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self

        userImageView.image = .gigachad
        userImageView.layer.cornerRadius = 10
        userImageView.clipsToBounds = true

        avatarImageView.layer.cornerRadius = 15
        avatarImageView.clipsToBounds = true

        optionImageView.image = .threePoints
        pageControl.addTarget(self, action: #selector(stateDidChange(sender:)), for: .valueChanged)
    }

    private func setConstraints() {
        scrollView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: likeCountLabel.bottomAnchor, constant: -38).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 239).isActive = true

        pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -119).isActive = true
    }

    @objc private func stateDidChange(sender: UIPageControl) {
        let ofsetX = UIScreen.main.bounds.width * CGFloat(pageControl.currentPage)
        scrollView.setContentOffset(CGPoint(x: ofsetX, y: 0), animated: true)
    }
}

// MARK: - Подписание на делегата скролл вью

extension PostViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
