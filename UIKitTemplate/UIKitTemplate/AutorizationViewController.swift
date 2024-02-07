// AutorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController авторизациия
class AutorizationViewController: UIViewController {
    @IBOutlet var passwordHideButton: UIButton!
    @IBOutlet var passwordHolder: UITextField!

    @IBAction func showPassword(_ sender: Any) {
        passwordHolder.isSecureTextEntry = !passwordHolder.isSecureTextEntry
        if !passwordHolder.isSecureTextEntry {
            passwordHideButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            passwordHideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
}
