// StoreViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран магазина
final class StoreViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let textTitle = "Каталог"
    }

    private let storeView = StoreView()

    // MARK: - Public Properties

    private let array: [Int: [UIImage]] = [
        0: [.manNews, .manSales, .brends, .shoesMan, .bagMan],
        1: [.blackChose, .saleSandal, .brends, .whiteSandal, .womenBag],
        2: [.sneakersWhite, .sneakersRed, .brends, .sneakersBlue, .redBag]
    ]

    var cart: ShopingCartViewContoller?

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = storeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    // MARK: - Private Methods

    private func configureView() {
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        let cameraButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        cameraButton.setImage(.camera, for: .normal)
        cameraButton.addTarget(self, action: #selector(turnOnCamera), for: .touchUpInside)
        let codeBut = UIImageView()
        codeBut.frame = CGRect(x: 30, y: -4, width: 40, height: 40)
        codeBut.image = .code
        customView.addSubview(cameraButton)
        customView.addSubview(codeBut)
        let customItem = UIBarButtonItem(customView: customView)
        navigationItem.rightBarButtonItem = customItem
        view.backgroundColor = .white
        title = Constants.textTitle

        storeView.segmentControll.selectedSegmentIndex = 0
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
        storeViewController.cart = cart
        navigationController?.pushViewController(storeViewController, animated: true)
    }

    @objc private func turnOnCamera() {
        let imagePicker = ImagePicker()
        imagePicker.showImagePicker(in: self, complition: nil)
    }
}
