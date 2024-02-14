// StoreItem.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Единица товара
struct StoreItem: Hashable {
    /// Имя товара
    let name: String
    /// Имя изображения товара
    let imageName: String
    /// Стоимость товара
    let coast: Int
    /// Размер товара
    var size: Int
}
