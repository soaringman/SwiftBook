//
//  MyCoursesSectionViewModel.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

/// #Вью модель секции с карточками курсов
struct MyCoursesSectionViewModel {
    /// Название секции
    var titleSection: String
    /// Название кнопки в заголовке
    var titleHeaderButton: String?
    /// Вью модели карточек
    var viewModels: [MyCourseViewModel]
}
