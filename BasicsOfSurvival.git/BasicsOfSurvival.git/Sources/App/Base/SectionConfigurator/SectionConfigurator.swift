//
//  SectionConfigurator.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import Foundation

/// #Базовый конфигуратор секции
class SectionConfigurator {
    /// Высота ячейки
    let heightCell: CGFloat
    /// Модель заголовка
    let headerModel: HeaderSectionModel?
    
    init(heightCell: CGFloat,
         headerModel: HeaderSectionModel?) {
        self.heightCell = heightCell
        self.headerModel = headerModel
    }
}
