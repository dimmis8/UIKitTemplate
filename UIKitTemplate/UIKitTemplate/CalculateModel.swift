// CalculateModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Ошибки, связанные с вводом значений
enum CalculateEror: CustomNSError {
    case notAllValuesExist
    case notAllValuesIsNumeric
}

/// Возможные операции с числами
enum Operation {
    case sum
    case difference
    case multiply
    case devide
}

/// Модель для калькулятора
struct CalculateModel {
    // MARK: - Public Methods

    func solve(_ firstValue: String?, _ secondVealue: String?, operation: Operation) throws -> Double {
        guard firstValue != nil, secondVealue != nil else { throw CalculateEror.notAllValuesExist }
        guard let firstNumber = Double(firstValue ?? "0"),
              let secondNumber = Double(secondVealue ?? "0") else { throw CalculateEror.notAllValuesIsNumeric }
        switch operation {
        case .sum:
            return firstNumber + secondNumber
        case .difference:
            return firstNumber - secondNumber
        case .multiply:
            return firstNumber * secondNumber
        case .devide:
            return firstNumber / secondNumber
        }
    }
}
