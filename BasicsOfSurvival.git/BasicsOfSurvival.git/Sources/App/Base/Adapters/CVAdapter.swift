//
//  CVAdapter.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 23.01.2023.
//

import UIKit

/// #Адаптер для горизонтального CollectionView без заголовка
final class CVAdapter: NSObject {
    private var builders: [CVItemBuilderProtocol] = []

    func configure(with sections: [CVItemBuilderProtocol]) {
        self.builders = sections
    }
}

// MARK: - UICollectionViewDataSource
extension CVAdapter: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        builders.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        builders[section].itemCount()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        builders[indexPath.section].cellAt(indexPath: indexPath,
                                           collectionView: collectionView)
    }
}

// MARK: - UICollectionViewDelegate
extension CVAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        /// Для ячеек с расширенной функциональностью
        if let itemBuilder = builders[indexPath.section] as? CVSelectableItemBuilderProtocol {
            itemBuilder.didSelectItem(indexPath: indexPath)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        builders[indexPath.section]
            .itemSize(indexPath: indexPath,
                      collectionView: collectionView)
    }
}
