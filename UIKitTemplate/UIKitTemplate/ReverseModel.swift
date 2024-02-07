// ReverseModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для переворачивания слова
struct ReverseModel {
    func reverce(_ textFromField: String?) -> String? {
        guard let text = textFromField else { return nil }
        guard !text.isEmpty else { return "" }
        return String(text.reversed()).lowercased().capitalized
    }
}
