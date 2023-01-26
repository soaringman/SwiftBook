//
//  PodcastCellBuilder.swift
//  BasicsOfSurvival.git
//
//  Created by Kislov Vadim on 25.01.2023.
//

import UIKit

/// #Строитель ячеек секции PodcastSection
final class PodcastCellBuilder {
    /// Вью модели карточек подкастов
    private let viewModels: [PodcastViewModel]
    
    weak var delegate: CellSelectable?
    
    init(viewModels: [PodcastViewModel], delegate: CellSelectable? = nil) {
        self.viewModels = viewModels
        self.delegate = delegate
    }
}

extension PodcastCellBuilder: CVSelectableItemBuilderProtocol {
    func didSelectItem(indexPath: IndexPath) {
        let id = viewModels[indexPath.row].id
        
        delegate?.didSelectItem(id: id)
    }
    
    func register(collectionView: UICollectionView) {
        collectionView.register(PodcastCell.self)
    }
    
    func itemCount() -> Int { viewModels.count }
    
    func itemSize(indexPath: IndexPath, collectionView: UICollectionView) -> CGSize {
        CGSize(width: collectionView.bounds.width * 0.45, height: collectionView.bounds.height)
    }
    
    func cellAt(indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(PodcastCell.self, indexPath: indexPath)
        
        let viewModel = viewModels[indexPath.item]
        cell.configure(with: viewModel)
        
        return cell
    }
    

}
