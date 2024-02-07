// CalculateModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Ошибки, связанные с вводом значений
enum CalculateEror: CustomNSError {
    case notAllValuesExist
    case notAllValuesIsNumeric
}

/// Модель для калькулятора
struct CalculateModel {
    func summ(_ firstValue: String?, _ secondVealue: String?) throws -> Double {
        guard firstValue != nil, secondVealue != nil else { throw CalculateEror.notAllValuesExist }
        guard let firstNumber = Double(firstValue ?? "0"),
              let secondNumber = Double(secondVealue ?? "0") else { throw CalculateEror.notAllValuesIsNumeric }
        return firstNumber + secondNumber
    }
}
