//
//  MyCourseCellBuilder.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Строитель ячейки курса в процессе прохождения
final class MyCourseCellBuilder {
    /// Высота ячейки
    private let height: CGFloat
    /// Конфигураторы секций коллекции внутри ячейки
    private let viewModels: [MyCourseViewModel]

    private weak var delegate: StudyContinuing?

    init(height: CGFloat,
         viewModels: [MyCourseViewModel],
         delegate: StudyContinuing?) {
        self.height = height
        self.viewModels = viewModels
        self.delegate = delegate
    }
}

// MARK: - TVCellBuilderProtocol
extension MyCourseCellBuilder: TVCellBuilderProtocol {
    func register(tableView: UITableView) {
        tableView.register(MyCourseCell.self)
    }

    func cellHeight() -> CGFloat { height }

    func cellCount() -> Int { viewModels.count }

    func cellAt(tableView: UITableView,
                indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(MyCourseCell.self,
                                                 indexPath: indexPath)
        let viewModel = viewModels[indexPath.row]
        cell.delegate = delegate
        cell.configure(with: viewModel)
        return cell
    }
}
