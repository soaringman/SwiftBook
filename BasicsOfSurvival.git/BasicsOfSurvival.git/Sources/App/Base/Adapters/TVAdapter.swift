//
//  TVAdapter.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 19.01.2023.
//

import UIKit

/// #Адаптер для TableView
final class TVAdapter: NSObject {
    private var sections: [TVSectionProtocol] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    private weak var tableView: UITableView?
    
    init(tableView: UITableView?) {
        self.tableView = tableView
    }
    
    func configure(with sections: [TVSectionProtocol]) {
        self.sections = sections
    }
}

// MARK: - UITableViewDataSource
extension TVAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { sections.count }
    
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        sections[section].cellBuilder.cellCount()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sections[indexPath.section].cellBuilder.cellAt(tableView: tableView,
                                                         indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerBuilder = sections[section].headerBuilder else { return nil }
        
        return headerBuilder.viewForHeaderInSection(tableView: tableView,
                                                                 section: section)
    }
    
    func tableView(_ tableView: UITableView,
                   viewForFooterInSection section: Int) -> UIView? {
        /// Установлен пустой Footer как отступ для секции
        UIView()
    }
}

// MARK: - UITableViewDelegate
extension TVAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        sections[indexPath.section].cellBuilder.cellHeight()
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        guard let headerBuilder = sections[section].headerBuilder else { return 0 }
        
        return headerBuilder.headerHeight()
    }
    
    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        AppConstants.bottomPaddingSectionTableView
    }
}
