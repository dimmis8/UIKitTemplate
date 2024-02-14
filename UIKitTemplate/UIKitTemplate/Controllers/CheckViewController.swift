// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Экран вью чека (делает коллега)
class CheckViewController: UIViewController {
    var coffieAndAddivities = CoffieAndAdditives()
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackgroundColor()
    }

    private func changeBackgroundColor() {
        view.backgroundColor = .white
    }
}
