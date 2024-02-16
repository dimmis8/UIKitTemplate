// SegmentCellView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран магазина
final class SegmentCellView: UIView {
    // MARK: - Constants

    enum Constants {
        static let newItemsLabelText = "Новинки"
        static let saleItemsLabelText = "Распродажа"
        static let nameFont = "Verdana-Bold"
        static let newItemsLabelSize = 14
        static let textWoman = "Женщинам"
        static let textMan = "Мужчинам"
        static let textChildren = "Детям"
        static let brendText = "Бренды"
        static let shoesText = "Обувь"
        static let bagText = "Сумки"
    }

    // MARK: - Visual Components

    var newItemsImageView = StoriesImageView(image: .manNews)
    var saleItemsImageView = StoriesImageView(image: .manSales)

    var oneCellProduct = SectionsCellView()
    var twoCellProduct = SectionsCellView()
    var threeCellProduct = SectionsCellView()

    private let newItemsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.newItemsLabelText
        label.font = UIFont(name: Constants.nameFont, size: CGFloat(Constants.newItemsLabelSize))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private let saleItemsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.saleItemsLabelText
        label.font = UIFont(name: Constants.nameFont, size: CGFloat(Constants.newItemsLabelSize))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    let segmentControll: UISegmentedControl = {
        var segment = UISegmentedControl()
        segment = UISegmentedControl(items: [Constants.textMan, Constants.textWoman, Constants.textChildren])
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()

    // MARK: - Public Properties

    let selectionGestureRecogniser = UITapGestureRecognizer()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        activateConstraint()
        activateCellProduct()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
        activateConstraint()
        activateCellProduct()
    }

    // MARK: - Private Methods

    private func configureView() {
        addSubview(newItemsImageView)
        addSubview(saleItemsImageView)
        addSubview(newItemsLabel)
        addSubview(saleItemsLabel)
        addSubview(segmentControll)
        addSubview(oneCellProduct)
        addSubview(twoCellProduct)
        addSubview(threeCellProduct)
    }

    private func activateCellProduct() {
        oneCellProduct.setNameLabel(name: Constants.brendText, image: .brends)
        twoCellProduct.setNameLabel(name: Constants.shoesText, image: .shoesMan)
        threeCellProduct.setNameLabel(name: Constants.bagText, image: .bagMan)
        oneCellProduct.translatesAutoresizingMaskIntoConstraints = false
        twoCellProduct.translatesAutoresizingMaskIntoConstraints = false
        threeCellProduct.translatesAutoresizingMaskIntoConstraints = false
        oneCellProduct.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        oneCellProduct.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        oneCellProduct.topAnchor.constraint(equalTo: newItemsImageView.bottomAnchor, constant: 20).isActive = true
        oneCellProduct.heightAnchor.constraint(equalToConstant: 80).isActive = true

        twoCellProduct.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        twoCellProduct.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        twoCellProduct.topAnchor.constraint(equalTo: oneCellProduct.bottomAnchor, constant: 20).isActive = true
        twoCellProduct.heightAnchor.constraint(equalToConstant: 80).isActive = true

        threeCellProduct.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        threeCellProduct.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        threeCellProduct.topAnchor.constraint(equalTo: twoCellProduct.bottomAnchor, constant: 20).isActive = true
        threeCellProduct.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func activateConstraint() {
        newItemsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        newItemsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 186).isActive = true
        newItemsImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        saleItemsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 186).isActive = true
        saleItemsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        saleItemsImageView.leadingAnchor.constraint(equalTo: newItemsImageView.trailingAnchor, constant: 15)
            .isActive = true
        newItemsLabel.topAnchor.constraint(equalTo: newItemsImageView.topAnchor).isActive = true
        newItemsLabel.centerXAnchor.constraint(equalTo: newItemsImageView.centerXAnchor).isActive = true
        saleItemsLabel.bottomAnchor.constraint(equalTo: saleItemsImageView.bottomAnchor).isActive = true
        saleItemsLabel.centerXAnchor.constraint(equalTo: saleItemsImageView.centerXAnchor).isActive = true

        segmentControll.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        segmentControll.topAnchor.constraint(equalTo: topAnchor, constant: 122).isActive = true
        segmentControll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        segmentControll.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
