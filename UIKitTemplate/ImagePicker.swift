// ImagePicker.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран камеры
class ImagePicker: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var imagePickerController: UIImagePickerController?
    var comlition: ((UIImage) -> ())?

    func showImagePicker(in viewController: UIViewController, complition: ((UIImage) -> ())?) {
        comlition = complition
        imagePickerController = UIImagePickerController()
        imagePickerController?.sourceType = .camera
        imagePickerController?.delegate = self
        viewController.present(imagePickerController ?? UIImagePickerController(), animated: true)
    }

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        if let image = info[.originalImage] as? UIImage {
            comlition?(image)
            picker.dismiss(animated: true)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
