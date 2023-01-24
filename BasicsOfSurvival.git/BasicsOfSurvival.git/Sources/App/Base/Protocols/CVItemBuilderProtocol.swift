//
//  CVSectionProtocol.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 23.01.2023.
//

import UIKit

/// #Протокол строителя ячеек коллекции
protocol CVItemBuilderProtocol {
    /// Регистрирует ячейку в коллекции
    func register(collectionView: UICollectionView)
    /// Возвращает высоту ячейки
    func itemCount() -> Int
    /// Возвращает размеры ячейки
    func itemSize(indexPath: IndexPath,
                  collectionView: UICollectionView) -> CGSize
    /// Создает ячейку по indexPath
    func cellAt(indexPath: IndexPath,
                collectionView: UICollectionView) -> UICollectionViewCell
}

/// #Протокол строителя для обработки нажатия на ячейку
protocol CVSelectableItemBuilderProtocol: CVItemBuilderProtocol {
    /// Ивент при нажатии на ячейку
    func didSelectItem(indexPath: IndexPath)
}
