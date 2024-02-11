// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
final class ViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var homeView = HomeView(frame: view.frame)

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view.addSubview(homeView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlertForName()
        homeView.delegateCalculate = self
    }

    // MARK: - Private Methods

    private func showAlertForName() {
        let alertControllerForName = UIAlertController(
            title: "Пожалуйста представьтесь",
            message: nil,
            preferredStyle: .alert
        )
        let actionOk = UIAlertAction(title: "Готово", style: .default) { _ in
            (self.view.subviews.first as? HomeView)?
                .createGreet(forName: alertControllerForName.textFields?.first?.text)
        }
        alertControllerForName.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }
        alertControllerForName.addAction(actionOk)
        present(alertControllerForName, animated: true)
    }

    private func showAlert(withTitle title: String, description: String?) {
        let alertControllerForName = UIAlertController(
            title: title,
            message: description,
            preferredStyle: .alert
        )
        let actionOk = UIAlertAction(title: "ОК", style: .default)
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)
        alertControllerForName.addAction(actionOk)
        alertControllerForName.addAction(actionCancel)
        present(alertControllerForName, animated: true)
    }
}

// MARK: - CalculateDelegate

extension ViewController: CalculateDelegate {
    // MARK: - Public Methods

    func guessTheNumber() {
        let game = GuessNumberModel()
        startNewRound(withState: nil)

        func startNewRound(withState state: AnswerOfGuess?) {
            var textForAlert: (title: String?, message: String?)
            switch state {
            case .none:
                textForAlert = ("Угадай число от 1 до 10", nil)
            case .larger:
                textForAlert = ("Попоробуйте еще раз", "Вы ввели слишком большое число")
            case .less:
                textForAlert = ("Попоробуйте еще раз", "Вы ввели слишком маленькое число")
            case .error:
                textForAlert = ("Ошибка", "Для ввода разрешены только числла")
            case .equals:
                showAlert(withTitle: "Поздравляем!", description: "Вы угадали")
            }

            let alertForGuess = UIAlertController(
                title: textForAlert.title,
                message: textForAlert.message,
                preferredStyle: .alert
            )
            let actionOk = UIAlertAction(title: "OK", style: .default) { _ in
                startNewRound(withState: game.compareNumberWithHidden(alertForGuess.textFields?.first?.text))
            }
            let actionClose = UIAlertAction(title: "Отмена", style: .cancel)
            alertForGuess.addTextField { textField in
                textField.placeholder = "Введите ваше число"
            }
            alertForGuess.addAction(actionOk)
            alertForGuess.addAction(actionClose)
            present(alertForGuess, animated: true)
        }
    }

    func calculate() {
        let alertForCalculate = UIAlertController(
            title: "Введите ваши числа",
            message: nil,
            preferredStyle: .alert
        )
        let choseOperation = UIAlertAction(title: "Выбрать операцию", style: .default) { _ in
            choseOperation()
        }
        let actionClose = UIAlertAction(title: "Отмена", style: .cancel)

        alertForCalculate.addTextField { textField in
            textField.placeholder = "Число 1"
        }
        alertForCalculate.addTextField { textField in
            textField.placeholder = "Число 2"
        }
        alertForCalculate.addAction(choseOperation)
        alertForCalculate.addAction(actionClose)
        present(alertForCalculate, animated: true)

        func choseOperation() {
            let alertChoseOperation = UIAlertController(
                title: "Выберете математическую операцию",
                message: nil,
                preferredStyle: .actionSheet
            )
            let actionSum = UIAlertAction(title: "Сложить", style: .default) { _ in
                calculate(withOperation: .sum)
            }
            let actionDifference = UIAlertAction(title: "Вычесть", style: .default) { _ in
                calculate(withOperation: .difference)
            }
            let actionMultiply = UIAlertAction(title: "Умножить", style: .default) { _ in
                calculate(withOperation: .multiply)
            }
            let actionDevide = UIAlertAction(title: "Разделить", style: .default) { _ in
                calculate(withOperation: .devide)
            }
            let actionClose = UIAlertAction(title: "Отмена", style: .cancel)

            alertChoseOperation.addAction(actionSum)
            alertChoseOperation.addAction(actionDifference)
            alertChoseOperation.addAction(actionMultiply)
            alertChoseOperation.addAction(actionDevide)
            alertChoseOperation.addAction(actionClose)
            present(alertChoseOperation, animated: true)
        }

        func calculate(withOperation operation: Operation) {
            do {
                let answer = try CalculateModel().solve(
                    alertForCalculate.textFields?.first?.text,
                    alertForCalculate.textFields?.last?.text,
                    operation: operation
                )
                showAlert(withTitle: "Результат", description: String(answer))
            } catch CalculateEror.notAllValuesExist {
                showAlert(withTitle: "Ошибка", description: "Не все значения введены")
            } catch CalculateEror.notAllValuesIsNumeric {
                showAlert(withTitle: "Ошибка", description: "Для ввода рашрешены только числа")
            } catch {
                showAlert(withTitle: "Ошибка", description: "Произошла неизвестная ошибка")
            }
        }
    }
}
