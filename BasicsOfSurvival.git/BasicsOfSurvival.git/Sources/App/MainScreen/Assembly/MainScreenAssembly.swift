//
//  MainScreenAssembly.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Компановщик модуля MainScreen
final class MainScreenAssembly {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - Assemblying
extension MainScreenAssembly: Assemblying {
    func assembly() -> UIViewController {
        let router = MainScreenRouter(navigationController: navigationController)
        let presenter = MainScreenPresenter(router: router)
        let viewController = MainScreenViewController(presenter: presenter)
        presenter.view = viewController

        return viewController
    }
}
