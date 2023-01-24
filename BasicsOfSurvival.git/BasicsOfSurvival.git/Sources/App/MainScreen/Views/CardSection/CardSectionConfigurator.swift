//
//  CardSectionConfigurator.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 23.01.2023.
//

import UIKit

/// #Конфигуратор секции с карточками
final class CardSectionConfigurator {
    /// Вью модели рецептов
    private let viewModels: [CardViewModel]
    /// Название заголовка
    private let titleSection: String
    /// Название кнопки заголовка
    private let titleButton: String?
    /// Высота ячейки
    private let heightCell: CGFloat
    /// Высота заголовка
    private let heightHeader: CGFloat
    /// Действие при нажатии на кнопку в заголовке
    private let action: ((Int) -> Void)?

    private weak var delegate: CellSelectable?

    init(viewModels: [CardViewModel],
         titleSection: String,
         titleButton: String?,
         heightCell: CGFloat,
         heightHeader: CGFloat,
         action: ((Int) -> Void)?,
         delegate: CellSelectable?) {
        self.viewModels = viewModels
        self.titleSection = titleSection
        self.titleButton = titleButton
        self.heightCell = heightCell
        self.heightHeader = heightHeader
        self.action = action
        self.delegate = delegate
    }
}

// MARK: - TVSectionConfigurator
extension CardSectionConfigurator: TVSectionConfigurator {
    func configure(for tableView: UITableView) -> TVSectionProtocol {
        /// Модель заголовка
        let headerModel = HeaderSectionModel(titleSection: titleSection,
                                             titleButton: titleButton,
                                             action: action)
        /// Конфигурируем билдер и регистрируем заголовок
        let headerBuilder = TVSectionHeaderBuilder(height: heightHeader,
                                                   model: headerModel)
        
        /// Конфигурируем билдер и регистрируем ячейки
        let cellBuilder = TVSingleCellBuilder(height: heightCell,
                                              models: viewModels,
                                              delegate: delegate)
        cellBuilder.register(tableView: tableView)
        
        /// Конфигурируем секцию
        let section = TVSectionBuilder(headerBuilder: headerBuilder,
                                             cellBuilder: cellBuilder)
        return section
    }
}
