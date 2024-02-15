// StoreViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран магазина
final class StoreViewController: UIViewController {
    var storeView = SegmentCellView()
    var cart: ShopingCartViewContoller?
    let array: [Int: [UIImage]] = [
        0: [.manNews, .manSales, .brends, .shoesMan, .bagMan],
        1: [.blackChose, .saleSandal, .brends, .whiteSandal, .womenBag],
        2: [.sneakersWhite, .sneakersRed, .brends, .sneakersBlue, .redBag]
    ]
    override func loadView() {
        super.loadView()
        view = storeView
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetItem()
        title = "Каталог"
        storeView.segmentControll.selectedSegmentIndex = 2
    }

    private func addTargetItem() {
        storeView.segmentControll.addTarget(self, action: #selector(changeSectorSegment), for: .valueChanged)
        storeView.selectionGestureRecogniser.addTarget(self, action: #selector(selectionCatolog))
    }

    @objc private func changeSectorSegment(target: UISegmentedControl) {
        if target == storeView.segmentControll {
            let segmentIndex = target.selectedSegmentIndex
            let storageImage = array[segmentIndex]
            storeView.newItemsImageView.image = storageImage?[0]
            storeView.saleItemsImageView.image = storageImage?[1]
            storeView.oneCellProduct.setImage(image: storageImage?[2])
            storeView.twoCellProduct.setImage(image: storageImage?[3])
            storeView.twoCellProduct.addGestureRecognizer(storeView.selectionGestureRecogniser)
            storeView.threeCellProduct.setImage(image: storageImage?[4])
        }
    }

    @objc private func selectionCatolog() {
        let storeViewController = ChoiceStoreViewController()
        navigationController?.pushViewController(storeViewController, animated: true)
    }
}

extension StoreViewController: ShopingCartDelegate {
    func reloadCartInformation(deletedItem: StoreItem) {}
}
