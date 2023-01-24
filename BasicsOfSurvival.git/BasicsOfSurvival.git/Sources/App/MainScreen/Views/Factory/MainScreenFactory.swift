//
//  MainScreenFactory.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 23.01.2023.
//

import UIKit

/// #Фабрика для настройки представления таблицы модуля MainScreen
final class MainScreenFactory {
    // MARK: - Properties
    private let tableView: UITableView
    private var sections: [MainScreenSections]
    private var tvAdapter: TVAdapter?

    private weak var delegate: MainScreenPresentation?

    // MARK: - Init
    ///  - Parameters:
    ///    - tableView: настраиваемая таблица
    ///    - sections: секции
    ///    - delegate: делегат для передачи UIEvent (VC)
    init(tableView: UITableView,
         sections: [MainScreenSections],
         delegate: MainScreenPresentation?) {
        self.tableView = tableView
        self.sections = sections
        self.delegate = delegate

        setupTableView()
    }

    // MARK: - Private func
    /// Обновляет секции
    func update(sections: [MainScreenSections]) {
        self.sections = sections
        tvAdapter?.configure(with: createSections())
    }
    
    /// Настраивает адаптер и табличное представление
    private func setupTableView() {
        tvAdapter = TVAdapter(tableView: tableView)
        
        tableView.dataSource = tvAdapter
        tableView.delegate = tvAdapter
        
        tvAdapter?.configure(with: createSections())
    }

    /// Создает строитель секции
    ///  - Parameters:
    ///     - type: тип секции
    ///  - Returns: объект протокола строителя секции
    private func createBuilder(type: MainScreenSections) -> TVSectionProtocol {
        switch type {
        case .cards(let viewModel):
            let action: ((Int) -> Void)? = { [weak self] section in
                self?.delegate?.didTapHeaderButton(section: section)
                print("didTapHeaderButton")
            }
            return CardSectionConfigurator(viewModels: viewModel.models,
                                           titleSection: viewModel.titleSection,
                                           titleButton: viewModel.titleHeaderButton,
                                           heightCell: Constants.heightCardSection,
                                           heightHeader: Constants.heightHeader,
                                           action: action,
                                           delegate: delegate).configure(for: tableView)
        }
    }
}

// MARK: - TVFactoryProtocol
extension MainScreenFactory: TVFactoryProtocol {
    func createSections() -> [TVSectionProtocol] {
        sections.map { createBuilder(type: $0) }
    }
}

// MARK: - Constants
extension MainScreenFactory {
    private struct Constants {
        static let heightHeader: CGFloat = 45
        
        static let heightCardSection: CGFloat = 175
        static let heightPassTestSection: CGFloat = 66
    }
}
