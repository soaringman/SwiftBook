//
//  Assemblying.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Протокол компоновки модулей на базе UIViewController
protocol Assemblying {

    /// Собрать VIPER-модуль
    ///  - Returns: UIViewController компонующего модуля
    func assembly() -> UIViewController
}
