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

    /// Создает секцию
    ///  - Parameter type: тип секции
    ///  - Returns: объект протокола строителя секции
    private func createBuilder(type: MainScreenSections) -> TVSectionProtocol {
        /// Действие при нажатии на кнопку в заголовке
        let action: ((Int) -> Void)? = { [weak self] section in
            self?.delegate?.didTapHeaderButton(section: section)
            print("didTapHeaderButton \(section)")
        }
        
        /// Конфигурируем секцию по типу
        switch type {
        case .cards(let viewModel):
            /// - секция карточек курсов, содержит ячейку с коллекцией
            let headerModel = HeaderSectionModel(titleSection: viewModel.titleSection,
                                                 titleButton: viewModel.titleHeaderButton,
                                                 heightHeader: Constants.heightHeader,
                                                 action: action)
            
            let builders = [CardItemBuilder(viewModels: viewModel.viewModels,
                                            delegate: delegate)]
            
            return TVSingleCellSectionConfigurator(builders: builders,
                                                   heightCell: Constants.heightCardSection,
                                                   headerModel: headerModel).configure(for: tableView)
            
        case .myCourses(let viewModel):
            /// - секция курсов, которые находятся в процессе прохождения
            let headerModel = HeaderSectionModel(titleSection: viewModel.titleSection,
                                                 titleButton: viewModel.titleHeaderButton,
                                                 heightHeader: Constants.heightHeader,
                                                 action: action)
            
            return MyCourseSectionConfigurator(viewModels: viewModel.viewModels,
                                               heightCell: Constants.heightMyCoursesSection,
                                               headerModel: headerModel,
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
private extension MainScreenFactory {
    struct Constants {
        static let heightHeader: CGFloat = 45
        
        static let heightCardSection: CGFloat = 175
        static let heightMyCoursesSection: CGFloat = 150
    }
}
