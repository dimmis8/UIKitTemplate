// StoreItem.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Единица товара
struct StoreItem: Hashable {
    /// Имя товара
    let name: String
    /// Имя изображения товара
    let itemImage: UIImage
    /// Стоимость товара
    let coast: Int
}

/// Параметры товара
enum Characteristics {
    /// Размер товара
    case size
    /// Количество товара
    case count
}
