// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view = HomeView(frame: view.frame)
        // self.view.backgroundColor = .white
        // self.view.addSubview(UIImageView(image: UIImage(named: "bacgroundImage")))
    }
}
