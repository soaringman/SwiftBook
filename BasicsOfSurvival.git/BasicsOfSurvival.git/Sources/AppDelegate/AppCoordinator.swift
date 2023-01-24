//
//  AppCoordinator.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Протокол координатора
protocol Coordinator {
    func start()
}

/// #Координатор приложения
final class AppCoordinator: Coordinator {

    private var rootViewController: UIViewController?
    private var window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        setupWindow()
    }

    /// Настраивает window
    private func setupWindow() {
        /// #Пока заглушка
        if true {
            /// Если пользователь уже просматривал экран `Launch` -> на главный экран
            let navigationVC = UINavigationController()
            let viewController = MainScreenAssembly(navigationController: navigationVC).assembly()
            navigationVC.viewControllers = [viewController]
            rootViewController = navigationVC
        } else {
            /// Если нет - настраиваем модуль `Launch`
        }

        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
