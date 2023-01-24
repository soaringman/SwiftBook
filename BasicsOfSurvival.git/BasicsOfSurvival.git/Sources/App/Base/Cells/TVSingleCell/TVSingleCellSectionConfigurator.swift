//
//  TVSingleCellSectionConfigurator.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Конфигуратор секции единичной ячейки с коллекцией
final class TVSingleCellSectionConfigurator: SectionConfigurator {
    private let builders: [CVItemBuilderProtocol]
    
    init(builders: [CVItemBuilderProtocol],
         heightCell: CGFloat,
         headerModel: HeaderSectionModel?) {
        self.builders = builders
        super.init(heightCell: heightCell,
                   headerModel: headerModel)
    }
}

// MARK: - CVSectionConfiguration
extension TVSingleCellSectionConfigurator: TVSectionConfiguration {
    
    func configure(for tableView: UITableView) -> TVSectionProtocol {
        /// Конфигурируем билдер заголовка
        var headerBuilder: TVSectionHeaderBuilder?
        if let headerModel = headerModel {
            headerBuilder = TVSectionHeaderBuilder(model: headerModel)
        }
        /// Конфигурируем билдер и регистрируем ячейки
        let cellBuilder = TVSingleCellBuilder(height: heightCell,
                                              builders: builders)
        cellBuilder.register(tableView: tableView)
        
        /// Конфигурируем секцию
        let section = TVSectionBuilder(headerBuilder: headerBuilder,
                                       cellBuilder: cellBuilder)
        return section
    }
}
