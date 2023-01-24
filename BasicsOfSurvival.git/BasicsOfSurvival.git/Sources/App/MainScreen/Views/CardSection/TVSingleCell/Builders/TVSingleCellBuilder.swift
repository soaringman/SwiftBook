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
    private let models: [CardViewModel]
    
    private weak var delegate: CellSelectable?

    init(height: CGFloat,
         models: [CardViewModel],
         delegate: CellSelectable?) {
        self.height = height
        self.models = models
        self.delegate = delegate
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
        cell.delegate = delegate
        cell.configure(with: models)
        return cell
    }
}
