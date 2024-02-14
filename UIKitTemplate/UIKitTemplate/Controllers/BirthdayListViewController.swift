// BirthdayListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер экрана со списком дней рождений
final class BirthdayListViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var birthdayListView = BirthdayListView(frame: view.frame, people: people)
    /// Массив с данными о людях
    private var people: [Person] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return [
            Person(
                imageOfPerson: UIImage(named: "imageHelena"),
                name: "Helena Link",
                birthday: dateFormatter.date(from: "2024-02-12") ?? Date(),
                age: 25,
                gender: .famale,
                telegram: "@helena"
            ),
            Person(
                imageOfPerson: UIImage(named: "imageVerona"),
                name: "Verona Tusk",
                birthday: dateFormatter.date(from: "2024-03-20") ?? Date(),
                age: 38,
                gender: .famale,
                telegram: "@Verona"
            ),
            Person(
                imageOfPerson: UIImage(named: "imageAlex"),
                name: "Alex Smith",
                birthday: dateFormatter.date(from: "2024-04-21") ?? Date(),
                age: 50,
                gender: .male,
                telegram: "none"
            ),
            Person(
                imageOfPerson: UIImage(named: "imageTom"),
                name: "Tom Johnson",
                birthday: dateFormatter.date(from: "2024-06-05") ?? Date(),
                age: 17,
                gender: .male,
                telegram: "@tom"
            )
        ]
    }

    // MARK: - loadView
    override func loadView() {
        super.loadView()
        view.addSubview(birthdayListView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(addNewBirthday)
        )
    }

    // MARK: - Public Methods
    @objc func addNewBirthday() {
        present(AddBirthdayViewController(), animated: true)
    }
}
