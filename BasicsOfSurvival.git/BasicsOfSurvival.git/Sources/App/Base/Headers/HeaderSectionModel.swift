//
//  HeaderSectionModel.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Модель заголовка секции
struct HeaderSectionModel {
    /// Название секции
    var titleSection: String
    /// Название кнопки
    var titleButton: String?
    /// Изображение кнопки
    var imageButton: UIImage?
    /// Действие при нажатии
    var action: ((Int) -> Void)?
}
