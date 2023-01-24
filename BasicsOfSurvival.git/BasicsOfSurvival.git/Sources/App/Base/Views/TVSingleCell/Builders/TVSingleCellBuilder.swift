//
//  TVSingleCellBuilder.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 23.01.2023.
//

import UIKit

/// #Строитель ячейки для размещения горизонтальной коллекции
final class TVSingleCellBuilder {
    /// Одна ячейка
    private let count = 1
    /// Высота ячейки
    private let height: CGFloat
    /// Конфигураторы секций коллекции внутри ячейки
    private let builders: [CVItemBuilderProtocol]

    init(height: CGFloat,
         builders: [CVItemBuilderProtocol]) {
        self.height = height
        self.builders = builders
    }
}

// MARK: - CVItemBuilderProtocol
extension TVSingleCellBuilder: TVCellBuilderProtocol {
    func register(tableView: UITableView) {
        tableView.register(TVSingleCell.self)
    }
    
    func cellHeight() -> CGFloat { height }
    
    func cellCount() -> Int { count }
    
    func cellAt(tableView: UITableView,
                indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(TVSingleCell.self,
                                                 indexPath: indexPath)
        cell.configure(with: builders)
        return cell
    }
}
