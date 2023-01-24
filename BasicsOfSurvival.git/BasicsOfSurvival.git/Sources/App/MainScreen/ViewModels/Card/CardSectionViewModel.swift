//
//  CardSectionViewModel.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 23.01.2023.
//

import Foundation

/// #Вью модель секции с карточками курсов
struct CardSectionViewModel {
    /// Название секции
    var titleSection: String
    /// Название кнопки в заголовке
    var titleHeaderButton: String?
    /// Вью модели карточек
    var viewModels: [CardViewModel]
}

