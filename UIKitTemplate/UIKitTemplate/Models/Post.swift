// Post.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Пост
struct Post {
    /// Ник пользователя
    let nickName: String
    /// Имя фото ватарки пользователя
    let avatarName: String
    /// Фото поста
    let photoNames: [String]
    /// Число лайков
    var likesNumber: Int
    /// Подпись
    let description: String
}
