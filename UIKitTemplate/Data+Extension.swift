// Data+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Расширение для форматирования даты из строки
extension Date {
    /// Получение даты из строки
    /// - Parameter customString: строка с датой
    /// - Returns: дата
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}
