//
//  PodcastSectionViewModel.swift
//  BasicsOfSurvival.git
//
//  Created by Kislov Vadim on 25.01.2023.
//

/// #Вью модель секции с карточками подкастов
struct PodcastSectionViewModel {
    /// Название секции
    var titleSection: String
    /// Название кнопки в заголовке
    var titleHeaderButton: String?
    /// Вью модели карточек
    var viewModels: [PodcastViewModel]
}
