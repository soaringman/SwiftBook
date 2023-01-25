//
//  UICollectionView + Extension.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 20.01.2023.
//

import UIKit

extension UICollectionView {
    /// Регистрирует ячейку коллекции
    func register<T: UICollectionViewCell>(_ classType: T.Type) {
        let string = String(describing: classType)
        register(classType,
                 forCellWithReuseIdentifier: string)
    }

    /// Переиспользование ячейки коллекции
    func dequeueReusableCell<T: UICollectionViewCell>(_ classType: T.Type,
                                                      indexPath: IndexPath) -> T {
        let string = String(describing: classType)
        guard let cell = dequeueReusableCell(withReuseIdentifier: string,
                                             for: indexPath) as? T else { fatalError() }
        return cell
    }
}
