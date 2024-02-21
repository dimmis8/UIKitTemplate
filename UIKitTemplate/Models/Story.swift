// Story.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Индикатор просмотра истории
enum ViewingStatus: Int {
    /// История просмотрена
    case isViewed
    /// История не просмотрена
    case isNotViewed
}

/// История
struct Story {
    /// Ник пользователя
    let nickName: String
    /// Название фото аватарки пользователя
    let photoName: String
}
