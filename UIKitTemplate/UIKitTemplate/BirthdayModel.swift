// BirthdayModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель, считающая количество дней до дня рождения
struct BirthdayModel {
    /// Метод, считающий сколько дней осталось до дня рождения
    func dayToBirthday(dateOfBirthday: Date) -> Int {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        let birthdayDate = dateFormatter.string(from: dateOfBirthday).components(separatedBy: ".")
        let todayDate = dateFormatter.string(from: Date()).components(separatedBy: ".")
        let (todayDay, todayMouth) = (todayDate.first ?? "0", todayDate.last ?? "0")
        let (birthdayDay, birthdayMounth) = (birthdayDate.first ?? "0", birthdayDate.last ?? "0")
        var targetYear: Int
        if birthdayMounth >= todayMouth, birthdayDay > todayDay {
            targetYear = 2024
        } else if birthdayMounth >= todayMouth, birthdayDay < todayDay {
            targetYear = 2024
        } else {
            targetYear = 2025
        }
        let targetDateComponents = DateComponents(
            year: targetYear,
            month: Int(birthdayDate.last ?? "0") ?? 0,
            day: Int(birthdayDate.first ?? "0") ?? 0
        )
        let targetDate = calendar.date(from: targetDateComponents) ?? Date()
        let difference = calendar.dateComponents([.day], from: Date(), to: targetDate)
        return (difference.day ?? 0) + 1
    }
}
