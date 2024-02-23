// SourceOfProfileInfo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Источник данных профиля
struct SourceOfProfileInfo {
    /// Истории
    private let storiesMap: [StatusOfStory: [Story]] = [
        .profileStory: [
            Story(description: "Запуск", photoName: "rocket"),
            Story(description: "Земля", photoName: "earth"),
            Story(description: "Еще земля", photoName: "earthCrop"),
            Story(description: "Посадки", photoName: "secondStage"),
            Story(description: "Больше запусков!", photoName: "rocket"),
            Story(description: "МКС", photoName: "earth")
        ]
    ]

    /// Посты
    private let postImages: [String] = [
        "rocket", "secondStage", "earth", "earthCrop", "rocket", "secondStage", "earth", "earthCrop", "rocket",
        "secondStage", "earth", "earthCrop", "rocket", "secondStage", "earthCrop", "rocket", "earth", "secondStage"
    ]

    /// Получение историй
    func getStories() -> [StatusOfStory: [Story]] {
        storiesMap
    }

    /// Получение постов
    func getPosts() -> [String] {
        postImages
    }

    /// Информация о профиле
    func getUserProfileInfo() -> ProfileInfo {
        ProfileInfo(
            nickName: "naironfeed",
            avatarName: "myPicture",
            description: "Videomaker",
            userName: "Дмитрий Логвинов",
            subscribtionsNumber: 150,
            subscrubersNumber: 350,
            postsNumber: 89,
            additionInfo: "https://www.spacex.com/vehicles/starship/"
        )
    }
}
