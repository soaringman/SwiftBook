//
//  TVSectionBuilder.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 23.01.2023.
//

/// #Строитель секции для таблицы
final class TVSectionBuilder: TVSectionProtocol {
    var headerBuilder: TVHeaderBuilderProtocol?
    var cellBuilder: TVCellBuilderProtocol

    init(headerBuilder: TVHeaderBuilderProtocol?,
         cellBuilder: TVCellBuilderProtocol) {
        self.headerBuilder = headerBuilder
        self.cellBuilder = cellBuilder
    }
}
