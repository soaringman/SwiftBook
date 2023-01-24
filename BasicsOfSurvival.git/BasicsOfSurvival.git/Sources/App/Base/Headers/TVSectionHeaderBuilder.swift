//
//  TVSectionHeaderBuilder.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 23.01.2023.
//

import UIKit

/// #Строитель заголовка секции Main
final class TVSectionHeaderBuilder {
    private let height: CGFloat
    private let model: HeaderSectionModel

    init(height: CGFloat,
         model: HeaderSectionModel) {
        self.height = height
        self.model = model
    }
}

// MARK: - CVHeaderBuilderProtocol
extension TVSectionHeaderBuilder: TVHeaderBuilderProtocol {
    
    func headerHeight() -> CGFloat { height }
    
    func viewForHeaderInSection(tableView: UITableView,
                                section: Int) -> UIView? {
        let headerView = TVSectionHeaderWithButton.init(frame: CGRect.init(x: 0,
                                                                           y: 0,
                                                                           width: tableView.frame.width,
                                                                           height: height))
        headerView.configure(model: model,
                             section: section)
        return headerView
    }
}
