// Story.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Индикатор просмотра истории
enum StatusOfStory: Int {
    /// История просмотрена
    case isViewed
    /// История не просмотрена
    case isNotViewed
    /// История профиля
    case profileStory
}

/// История
struct Story {
    /// Описание
    let description: String
    /// Название фото аватарки пользователя
    let photoName: String
}
