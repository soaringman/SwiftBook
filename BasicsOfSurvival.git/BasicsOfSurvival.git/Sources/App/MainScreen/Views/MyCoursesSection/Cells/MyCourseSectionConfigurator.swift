//
//  MyCourseSectionConfigurator.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Конфигуратор секции единичной ячейки с коллекцией
final class MyCourseSectionConfigurator: SectionConfigurator {
    /// Вью модели курсов
    private let viewModels: [MyCourseViewModel]

    private weak var delegate: StudyContinuing?

    init(viewModels: [MyCourseViewModel],
         heightCell: CGFloat,
         headerModel: HeaderSectionModel?,
         delegate: StudyContinuing?) {
        self.viewModels = viewModels
        self.delegate = delegate
        super.init(heightCell: heightCell,
                   headerModel: headerModel)
    }
}

// MARK: - TVSectionConfiguration
extension MyCourseSectionConfigurator: TVSectionConfiguration {

    func configure(for tableView: UITableView) -> TVSectionProtocol {
        /// Конфигурируем билдер заголовка
        var headerBuilder: TVSectionHeaderBuilder?
        if let headerModel = headerModel {
            headerBuilder = TVSectionHeaderBuilder(model: headerModel)
        }
        /// Конфигурируем билдер и регистрируем ячейки
        let cellBuilder = MyCourseCellBuilder(height: heightCell,
                                              viewModels: viewModels,
                                              delegate: delegate)
        cellBuilder.register(tableView: tableView)

        /// Конфигурируем секцию
        let section = TVSectionBuilder(headerBuilder: headerBuilder,
                                       cellBuilder: cellBuilder)
        return section
    }
}
