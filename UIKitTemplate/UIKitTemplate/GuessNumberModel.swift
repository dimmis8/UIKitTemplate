// GuessNumberModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// результаты сравнения чисел
enum AnswerOfGuess {
    case equals
    case larger
    case less
    case error
}

/// Модель для калькулятора
struct GuessNumberModel {
    // MARK: - Constants

    let hiddenNnumber = Int.random(in: 1 ... 10)

    // MARK: - Public Methods

    func compareNumberWithHidden(_ enteredNumber: String?) -> AnswerOfGuess {
        guard enteredNumber != nil else { return .error }
        guard let number = Int(enteredNumber ?? "0") else { return .error }
        switch enteredNumber {
        case _ where number > hiddenNnumber:
            return .larger
        case _ where number < hiddenNnumber:
            return .less
        case _ where number == hiddenNnumber:
            return .equals
        default:
            return .error
        }
    }
}
