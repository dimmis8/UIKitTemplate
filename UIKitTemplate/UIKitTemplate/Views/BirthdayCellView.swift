// BirthdayCellView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Перечисление с гендерами
enum Gender {
    /// мужчина
    case male
    /// женщина
    case famale
}

/// Структура описания человека для его отображения в ячейке приложения
struct Person {
    let imageOfPerson: UIImage?
    let name: String
    let birthday: Date
    let age: Int
    let gender: Gender
    let telegram: String
}

/// Класс для создания ячейки одного персонажа
final class BirthdayCellView: UIView {
    /// Свойство хранящее экземпляр персонажа
    private let person: Person
    /// Изображение персонажа
    private var personImageView: UIImageView? {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        imageView.image = person.imageOfPerson
        imageView.layer.cornerRadius = 37
        return imageView
    }

    /// Имя персонажа
    private var nameView: UILabel {
        let label = UILabel(frame: CGRect(x: 83, y: 14, width: 209, height: 20))
        label.text = person.name
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }

    /// Когда день рождения и сколько лет исполнится
    private var birthdayLabel: UILabel {
        let label = UILabel(frame: CGRect(x: 83, y: 42, width: 209, height: 20))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        let formattedStartDate = dateFormatter.string(from: person.birthday)
        label.text = "\(formattedStartDate) - turns \(person.age + 1)"
        return label
    }

    /// Вьюшка с датой или тортом
    private var birthdayImage: UIView {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        if dateFormatter.string(from: person.birthday) == dateFormatter.string(from: Date()) {
            let birthdayImage = UIImageView(frame: CGRect(x: 295, y: 14, width: 44, height: 44))
            birthdayImage.image = UIImage(named: "cakeImage")
            return birthdayImage
        } else {
            let birthdayImage = UILabel(frame: CGRect(x: 295, y: 14, width: 44, height: 44))
            birthdayImage.text = "\(BirthdayModel().countDayToBirthday(dateOfBirthday: person.birthday))"
            return birthdayImage
        }
    }

    init(person: Person, frame: CGRect) {
        self.person = person
        super.init(frame: frame)
        createView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Функция прорисовки вью
    private func createView() {
        addSubview(personImageView ?? UIView())
        addSubview(nameView)
        addSubview(birthdayLabel)
        addSubview(birthdayImage)
    }
}
