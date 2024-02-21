// NotificationApp.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Уведомления
struct NotificationApp {
    /// Ник пользователя
    let nickName: String
    /// Имя аватарки пользователя
    let avatarImageName: String
    /// Имя фото поста
    let photoPostName: String?
    /// Подпись
    let description: String
    /// Дата уведомления
    let dateOfNotification: Date
}
