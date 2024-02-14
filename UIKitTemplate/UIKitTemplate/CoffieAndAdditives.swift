// CoffieAndAdditives.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Структура для передачи выбора клиента на экран с чеком
struct CoffieAndAdditives {
    // MARK: - Types

    enum Constant {
        static let americano = "Американо"
        static let cappuccino = "Капучино"
        static let latte = "Латте"
    }

    /// Вид кофе
    /// - Parameters:
    ///  - Americano: Американо
    ///  - Cappuccino: Капучино
    ///  - Latte: Латте
    enum Coffie: Int {
        case americano = 100
        case cappuccino = 130
        case latte = 160
    }

    // MARK: - Public Properties

    /// Добавки
    let aditives = ["Молоко": 50, "Сироп": 20, "Молоко соевое": 50, "Молоко миндальное": 70, "Эспрессо 50мл": 50]
    /// Выбранное кофе

    var coffie: Coffie = .americano
    /// Выбранные добавки
    var selectedAditives: [String] = []

    /// Получения названия выбраного кофе
    var discriptionCoffie: String {
        switch coffie {
        case .americano:
            return Constant.americano
        case .cappuccino:
            return Constant.cappuccino
        case .latte:
            return Constant.latte
        }
    }

    // MARK: - Public Methods

    /// Функция подсчета сумма
    /// - Returns:
    ///  - sum: сумма заказа
    func calculateSum() -> Int {
        var sum = coffie.rawValue
        guard !selectedAditives.isEmpty else { return sum }
        for aditive in selectedAditives {
            sum += aditives[aditive] ?? 0
        }
        return sum
    }
}

/// Прожарка кофе
enum RoastOfCoffe {
    /// Светлая прожарка
    case light
    /// Темная прожарка
    case dark
}
