//
//  MainScreenRouter.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Слой навигации модуля MainScreen
final class MainScreenRouter {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - MainScreenRouting
extension MainScreenRouter: MainScreenRouting {
    
}

