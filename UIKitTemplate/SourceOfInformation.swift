// SourceOfInformation.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Индикатор просмотра истории
enum ViewingStatus: Int {
    /// История просмотрена
    case isViewed
    /// История не просмотрена
    case isNotViewed
}

/// Источник данных
struct SourceOfInformation {
    /// Истории
    private let storiesMap: [ViewingStatus: [Story]] = [
        .isNotViewed: [
            Story(nickname: "gigachad", photo: .gigachad),
            Story(nickname: "gigachad", photo: .gigachad)
        ],
        .isViewed: [
            Story(nickname: "gigachad", photo: .gigachad),
            Story(nickname: "gigachad", photo: .gigachad),
            Story(nickname: "gigachad", photo: .gigachad),
            Story(nickname: "gigachad", photo: .gigachad)
        ]
    ]

    /// Рекомендации
    private let recomendations: [Recomendation] = [
        Recomendation(nickname: "merlinmonro", photo: .monro),
        Recomendation(nickname: "voznyak", photo: .voznyak),
        Recomendation(nickname: "merlinmonro", photo: .monro),
        Recomendation(nickname: "voznyak", photo: .voznyak),
        Recomendation(nickname: "gigachad", photo: .gigachad)
    ]

    /// Посты
    private let posts: [Post] = [
        Post(
            nickname: "djigan",
            avatar: .djigan,
            photos: [.sea, .seaAnother, .post],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        ),
        Post(
            nickname: "djigan",
            avatar: .djigan,
            photos: [.seaAnother],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        ),
        Post(
            nickname: "djigan",
            avatar: .djigan,
            photos: [.post],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        ),
        Post(
            nickname: "djigan",
            avatar: .djigan,
            photos: [.sea],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        ),
        Post(
            nickname: "djigan",
            avatar: .djigan,
            photos: [.seaAnother],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        ),
        Post(
            nickname: "djigan",
            avatar: .djigan,
            photos: [.post],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        )
    ]

    /// Получение рекомендаций
    func getRecomendations() -> [Recomendation] {
        recomendations
    }

    /// Получение историй
    func getStories() -> [ViewingStatus: [Story]] {
        storiesMap
    }

    /// Получение постов
    func getPosts() -> [Post] {
        posts
    }

    /// Информация о профиле
    func getUserProfilePhoto() -> UIImage {
        .myProfile
    }
}

/// История
struct Story {
    /// Ник пользователя
    let nickname: String
    /// Аватарка пользователя
    let photo: UIImage
}

/// Рекомендация
struct Recomendation {
    /// Ник пользователя
    let nickname: String
    /// Аватарка пользователя
    let photo: UIImage
}

/// Пост
struct Post {
    /// Ник пользователя
    let nickname: String
    /// Аватарка пользователя
    let avatar: UIImage
    /// Аватарка пользователя
    let photos: [UIImage]
    /// Число лайков
    var likesNumber: Int
    /// Подпись
    let description: String
}
