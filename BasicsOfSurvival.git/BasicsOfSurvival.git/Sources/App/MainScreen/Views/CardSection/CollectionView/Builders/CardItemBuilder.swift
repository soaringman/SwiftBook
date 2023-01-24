//
//  CardItemBuilder.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 23.01.2023.
//

import UIKit

/// #Строитель ячеек секции Card
final class CardItemBuilder {
    /// Вью модели карточек курсов
    private let viewModels: [CardViewModel]

    weak var delegate: CellSelectable?
    
    init(viewModels: [CardViewModel],
         delegate: CellSelectable?) {
        self.viewModels = viewModels
        self.delegate = delegate
    }
}

// MARK: - RecommendedItemBuilder
extension CardItemBuilder: CVSelectableItemBuilderProtocol {

    func register(collectionView: UICollectionView) {
        collectionView.register(CardCollectionViewCell.self)
    }

    func itemCount() -> Int { viewModels.count }

    func itemSize(indexPath: IndexPath, collectionView: UICollectionView) -> CGSize {
        CGSize(width: collectionView.bounds.width * 0.75,
               height: collectionView.bounds.height)
    }
    
    func cellAt(indexPath: IndexPath,
                collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CardCollectionViewCell.self,
                                                      indexPath: indexPath)
        let viewModel = viewModels[indexPath.item]
        cell.configure(with: viewModel)
        
        return cell
    }

    func didSelectItem(indexPath: IndexPath) {
        let id = viewModels[indexPath.row].id
        delegate?.didSelectItem(id: id)
    }
}
