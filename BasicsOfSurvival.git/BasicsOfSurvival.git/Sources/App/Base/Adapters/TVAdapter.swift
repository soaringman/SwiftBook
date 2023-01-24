//
//  TVAdapter.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 19.01.2023.
//

import UIKit

/// #Адаптер для TableView
final class TVAdapter: NSObject {
    private var viewModels: [TVSectionProtocol] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private weak var tableView: UITableView?
    
    init(tableView: UITableView?) {
        self.tableView = tableView
    }
    
    func configure(with viewModels: [TVSectionProtocol]) {
        guard let tableView = tableView else { return }
        
        viewModels.forEach {
            $0.cellBuilder.register(tableView: tableView)
        }
        self.viewModels = viewModels
    }
}

// MARK: - UITableViewDataSource
extension TVAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { viewModels.count }
    
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        viewModels[section].cellBuilder.cellCount()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModels[indexPath.section].cellBuilder.cellAt(tableView: tableView,
                                                         indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerBuilder = viewModels[section].headerBuilder else { return nil }
        
        return headerBuilder.viewForHeaderInSection(tableView: tableView,
                                                                 section: section)
    }
}

// MARK: - UITableViewDelegate
extension TVAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModels[indexPath.section].cellBuilder.cellHeight()
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        guard let headerBuilder = viewModels[section].headerBuilder else { return 0 }
        
        return headerBuilder.headerHeight()
    }
}
