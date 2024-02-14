// BirthdayListView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью списка дней рождений
final class BirthdayListView: UIView {
    init(frame: CGRect, people: [Person]) {
        super.init(frame: frame)
        createView(people: people)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// функция создания вью
    private func createView(people: [Person]) {
        for personNumber in 0 ..< people.count {
            addSubview(BirthdayCellView(
                person: people[personNumber],
                frame: CGRect(x: 18, y: 100 + personNumber * 95, width: 339, height: 75)
            ))
        }
    }
}
