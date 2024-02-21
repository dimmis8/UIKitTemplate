// SourceOfInformation.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

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
            Story(nickName: "gigachad", photoName: "gigachad"),
            Story(nickName: "gigachad", photoName: "gigachad")
        ],
        .isViewed: [
            Story(nickName: "gigachad", photoName: "gigachad"),
            Story(nickName: "gigachad", photoName: "gigachad"),
            Story(nickName: "gigachad", photoName: "gigachad"),
            Story(nickName: "gigachad", photoName: "gigachad")
        ]
    ]

    /// Рекомендации
    private let recomendations: [Recomendation] = [
        Recomendation(nickName: "merlinmonro", avatarName: "monro"),
        Recomendation(nickName: "voznyak", avatarName: "voznyak"),
        Recomendation(nickName: "merlinmonro", avatarName: "monro"),
        Recomendation(nickName: "voznyak", avatarName: "voznyak"),
        Recomendation(nickName: "gigachad", avatarName: "gigachad")
    ]

    /// Посты
    private let posts: [Post] = [
        Post(
            nickName: "djigan",
            avatarName: "djigan",
            photoNames: ["sea", "seaAnother", "post"],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        ),
        Post(
            nickName: "djigan",
            avatarName: "djigan",
            photoNames: ["seaAnother"],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        ),
        Post(
            nickName: "djigan",
            avatarName: "djigan",
            photoNames: ["post"],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        ),
        Post(
            nickName: "djigan",
            avatarName: "djigan",
            photoNames: ["sea"],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        ),
        Post(
            nickName: "djigan",
            avatarName: "djigan",
            photoNames: ["seaAnother"],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        ),
        Post(
            nickName: "djigan",
            avatarName: "djigan",
            photoNames: ["post"],
            likesNumber: 1242,
            description: "Пока на раслабоне, на чиле. Поэтому можно ща пивко того-самого... "
        )
    ]

    /// уведомления
    var notifications: [NotificationsGroups: [NotificationApp]] = [
        .today: [
            NotificationApp(
                nickName: "garlic13",
                avatarImageName: "djigan",
                photoPostName: "sea",
                description: "упомянул(-а) вас в комментарии: \"тож на чиле?)00)\"",
                dateOfNotification: Date.dateFromCustomString(customString: "20/02/2024")
            ),
            NotificationApp(
                nickName: "garlic13",
                avatarImageName: "djigan",
                photoPostName: "sea",
                description: "упомянул(-а) вас в комментарии: \"согласен!\"",
                dateOfNotification: Date.dateFromCustomString(customString: "20/02/2024")
            )
        ],
        .thisWeek: [
            NotificationApp(
                nickName: "garlic13",
                avatarImageName: "djigan",
                photoPostName: "sea",
                description: "упомянул(-а) вас в комментарии: \"Это где?\"",
                dateOfNotification: Date.dateFromCustomString(customString: "18/02/2024")
            ),
            NotificationApp(
                nickName: "illomio",
                avatarImageName: "gigachad",
                photoPostName: nil,
                description: "появился(-ась) в RMLink. Вы можете быть знакомы",
                dateOfNotification: Date.dateFromCustomString(customString: "18/02/2024")
            ),
            NotificationApp(
                nickName: "garlic13",
                avatarImageName: "djigan",
                photoPostName: nil,
                description: "подписался(-ась) на ваши новости",
                dateOfNotification: Date.dateFromCustomString(customString: "15/02/2024")
            ),
            NotificationApp(
                nickName: "garlic13",
                avatarImageName: "djigan",
                photoPostName: "seaAnother",
                description: "понравился ваш комментарий: \"Супер фото\"",
                dateOfNotification: Date.dateFromCustomString(customString: "14/02/2024")
            ),
            NotificationApp(
                nickName: "sunsay",
                avatarImageName: "monro",
                photoPostName: nil,
                description: "появился(-ась) в RMLink. Вы можете быть знакомы",
                dateOfNotification: Date.dateFromCustomString(customString: "13/02/2024")
            ),
            NotificationApp(
                nickName: "voznyak",
                avatarImageName: "voznyak",
                photoPostName: nil,
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
        notifications
    }
}
