//
//  UITableView + Extension.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 20.01.2023.
//

import UIKit

extension UITableView {
    /// Регистрирует ячейку коллекции
    func register<T: UITableViewCell>(_ classType: T.Type) {
        let string = String(describing: classType)
        register(classType,
                 forCellReuseIdentifier: string)
    }

    /// Переиспользование ячейки коллекции
    func dequeueReusableCell<T: UITableViewCell>(_ classType: T.Type,
                                                 indexPath: IndexPath) -> T {
        let string = String(describing: classType)
        guard let cell = dequeueReusableCell(withIdentifier: string,
                                             for: indexPath) as? T else { fatalError() }
        return cell
    }
}
