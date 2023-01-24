//
//  MyCourseCellBuilder.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Строитель ячейки для размещения горизонтальной коллекции
final class MyCourseCellBuilder {
    /// Высота ячейки
    private let height: CGFloat
    /// Конфигураторы секций коллекции внутри ячейки
    private let models: [MyCourseViewModel]
    
    private weak var delegate: MainScreenPresentation?

    init(height: CGFloat,
         models: [MyCourseViewModel],
         delegate: MainScreenPresentation?) {
        self.height = height
        self.models = models
        self.delegate = delegate
    }
}

// MARK: - CVItemBuilderProtocol
extension MyCourseCellBuilder: TVCellBuilderProtocol {
    func register(tableView: UITableView) {
        tableView.register(MyCourseCell.self)
    }
    
    func cellHeight() -> CGFloat { height }
    
    func cellCount() -> Int { models.count }
    
    func cellAt(tableView: UITableView,
                indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(MyCourseCell.self,
                                                 indexPath: indexPath)
//        cell.delegate = delegate
//        cell.configure(with: models)
        return cell
    }
}
