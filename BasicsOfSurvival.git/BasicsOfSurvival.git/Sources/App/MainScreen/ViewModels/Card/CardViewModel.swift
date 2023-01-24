//
//  CardViewModel.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 19.01.2023.
//

import UIKit

/// #Вью модель карточки курса
struct CardViewModel {
    /// Идентификатор курса
    var id: Int
    /// Название курса
    var courseName: String
    /// Количество тем
    var numberOfTopics: String
    /// Количество тестов
    var numberOfTests: String
    /// Общее время
    var totalTime: String
    /// Прогресс в процентах
    var percentageProgress: Int
    /// Название изображения
    var imageName: String?
}





