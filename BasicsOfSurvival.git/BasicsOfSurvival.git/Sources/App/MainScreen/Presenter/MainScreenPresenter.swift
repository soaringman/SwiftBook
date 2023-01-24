//
//  MainScreenPresenter.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import Foundation

/// #Варианты секций для главного экрана
enum MainScreenSections {
    /// секция с коллекцией карточек
    case cards(CardSectionViewModel)
}

/// #Протокол управления View-слоем модуля MainScreen
protocol MainScreenViewable: AnyObject {
    /// Обновить секции 
    func update(sections: [MainScreenSections])
}

/// #Протокол управления слоем навигации модуля MainScreen
protocol MainScreenRouting {
    
}

// MARK: - Presenter
/// #Слой презентации модуля MainScreen
final class MainScreenPresenter {
    
    private let router: MainScreenRouting
    weak var view: MainScreenViewable?
    
    init(router: MainScreenRouting) {
        self.router = router
    }
}

// MARK: - MainScreenPresentation
extension MainScreenPresenter: MainScreenPresentation {
    func didTapHeaderButton(section: Int) {
        /// Обработка
    }
    
    func didSelectItem(id: Int) {
        /// Обработка
    }
}
