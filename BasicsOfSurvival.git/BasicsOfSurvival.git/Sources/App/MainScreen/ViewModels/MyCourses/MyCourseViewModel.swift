//
//  MyCourseViewModel.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import Foundation

struct MyCourseViewModel {
    /// Идентификатор курса
    var id: Int
    /// Название курса
    var courseName: String
    /// Короткое описание
    var shortDescription: String
    /// Общее количество тестов в курсе
    var totalTests: Int
    /// Количество пройденных тестов
    var passedTests: Int
    /// Название изображения
    var imageName: String?
}
