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

// Разделение дат просмотра сториз
enum NotificationsGroups: Int {
    /// Сегодня
    case today
    /// На этой неделе
    case thisWeek
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

    /// уведомления
    var notification: [NotificationsGroups: [NotificationApp]] = [
        .today: [
            NotificationApp(
                nickname: "garlic13",
                avatar: .djigan,
                photo: .sea,
                description: "упомянул(-а) вас в комментарии: \"тож на чиле?)00)\"",
                dateOfNotification: Date.dateFromCustomString(customString: "20/02/2024")
            ),
            NotificationApp(
                nickname: "garlic13",
                avatar: .djigan,
                photo: .sea,
                description: "упомянул(-а) вас в комментарии: \"согласен!\"",
                dateOfNotification: Date.dateFromCustomString(customString: "20/02/2024")
            )
        ],
        .thisWeek: [
            NotificationApp(
                nickname: "garlic13",
                avatar: .djigan,
                photo: .sea,
                description: "упомянул(-а) вас в комментарии: \"Это где?\"",
                dateOfNotification: Date.dateFromCustomString(customString: "18/02/2024")
            ),
            NotificationApp(
                nickname: "illomio",
                avatar: .gigachad,
                photo: nil,
                description: "появился(-ась) в RMLink. Вы можете быть знакомы",
                dateOfNotification: Date.dateFromCustomString(customString: "18/02/2024")
            ),
            NotificationApp(
                nickname: "garlic13",
                avatar: .djigan,
                photo: nil,
                description: "подписался(-ась) на ваши новости",
                dateOfNotification: Date.dateFromCustomString(customString: "15/02/2024")
            ),
            NotificationApp(
                nickname: "garlic13",
                avatar: .djigan,
                photo: .seaAnother,
                description: "понравился ваш комментарий: \"Супер фото\"",
                dateOfNotification: Date.dateFromCustomString(customString: "14/02/2024")
            ),
            NotificationApp(
                nickname: "sunsay",
                avatar: .monro,
                photo: nil,
                description: "появился(-ась) в RMLink. Вы можете быть знакомы",
                dateOfNotification: Date.dateFromCustomString(customString: "13/02/2024")
            ),
            NotificationApp(
                nickname: "voznyak",
                avatar: .voznyak,
                photo: nil,
                description: "появился(-ась) в RMLink. Вы можете быть знакомы",
                dateOfNotification: Date.dateFromCustomString(customString: "13/02/2024")
            )
        ]
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

    /// Получение уведомлений, сгруппированных по дате
    func getGroupedNotifications() -> [NotificationsGroups: [NotificationApp]] {
        notification
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
    /// Фото поста
    let photos: [UIImage]
    /// Число лайков
    var likesNumber: Int
    /// Подпись
    let description: String
}

/// Уведомления
struct NotificationApp {
    /// Ник пользователя
    let nickname: String
    /// Аватарка пользователя
    let avatar: UIImage
    /// Фото поста
    let photo: UIImage?
    /// Подпись
    let description: String
    /// Дата уведомления
    let dateOfNotification: Date
}
