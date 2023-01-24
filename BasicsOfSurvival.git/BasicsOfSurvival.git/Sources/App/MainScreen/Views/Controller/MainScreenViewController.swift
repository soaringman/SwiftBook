//
//  MainScreenViewController.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Протокол передачи UI-ивентов слою презентации
protocol MainScreenPresentation: CellSelectable {
    /// Нажата кнопка в заголовке
    /// - Parameter section: секция
    func didTapHeaderButton(section: Int)
}

/// #Контроллер главного экрана (В РАБОТЕ)
final class MainScreenViewController: UIViewController {
    // MARK: - Properties
    private let presenter: MainScreenPresentation
    private var factory: MainScreenFactory?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Init & ViewDidLoad
    init(presenter: MainScreenPresentation) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
    }
    
    // MARK: - Functions
    private func setupElements() {
        view.backgroundColor = .white
        let cardModel = CardViewModel(id: 124, courseName: "Военное положение",
                                      numberOfTopics: "10 тем",
                                      numberOfTests: "15 тестов",
                                      totalTime: "1ч 48мин",
                                      percentageProgress: 70,
                                      imageName: "mockImage")
        
        let array = [cardModel, cardModel, cardModel]
        let viewModels = [CardSectionViewModel(titleSection: "Местность", titleHeaderButton: "Все", models: array),
                          CardSectionViewModel(titleSection: "Природные условия", titleHeaderButton: "Все", models: array),
                          CardSectionViewModel(titleSection: "Экстреимальные ситуации", titleHeaderButton: "Все", models: array)]
        
        let sections = viewModels.map { MainScreenSections.cards($0) }
        
        
        factory = MainScreenFactory(tableView: tableView,
                                    sections: sections,
                                    delegate: nil)
        setupConstraints()
    }
    
    func setupConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: - MainScreenViewable
extension MainScreenViewController: MainScreenViewable {
    func update(sections: [MainScreenSections]) {
        factory?.update(sections: sections)
    }
}
