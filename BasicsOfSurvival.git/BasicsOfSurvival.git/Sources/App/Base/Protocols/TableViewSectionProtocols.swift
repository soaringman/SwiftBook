//
//  TableViewSectionProtocols.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 23.01.2023.
//

import UIKit

/// #Протокол фабрики для TableView
protocol TVFactoryProtocol {
    /// Создает секции
    func createSections() -> [TVSectionProtocol]
}

/// #Протокол конфигурации секции таблицы
protocol TVSectionConfiguration {
    /// Конфигурирует и возвращает секцию
    func configure(for tableView: UITableView) -> TVSectionProtocol
}

/// #Протокол вью-модели секции таблицы
protocol TVSectionProtocol {
    /// Строитель заголовка
    var headerBuilder: TVHeaderBuilderProtocol? { get }
    /// Строитель ячеек
    var cellBuilder: TVCellBuilderProtocol { get }
    /// Инициализатор
    init(headerBuilder: TVHeaderBuilderProtocol?,
         cellBuilder: TVCellBuilderProtocol)
}

/// #Протокол строителя ячейки таблицы
protocol TVCellBuilderProtocol {
    /// Регистрирует ячейку в таблице
    func register(tableView: UITableView)
    /// Возвращает высоту ячейки
    func cellHeight() -> CGFloat
    /// Возвращает количество ячеек
    func cellCount() -> Int
    /// Создает ячейку по indexPath
    func cellAt(tableView: UITableView,
                indexPath: IndexPath) -> UITableViewCell
}

/// #Протокол строителя заголовка таблицы
protocol TVHeaderBuilderProtocol {
    /// Возвращает высоту заголовка
    func headerHeight() -> CGFloat
    /// Определяет вью для заголовка секции таблицы
    func viewForHeaderInSection(tableView: UITableView,
                                section: Int) -> UIView?
}
