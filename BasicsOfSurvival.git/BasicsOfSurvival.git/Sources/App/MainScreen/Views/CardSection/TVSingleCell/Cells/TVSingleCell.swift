//
//  TVSingleCell.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 20.01.2023.
//

import UIKit

/// #Ячейка для размещения горизонтальной коллекции
final class TVSingleCell: TVBaseCell {
    // MARK: - Properties
    /// Делегат нажатия на ячейку
    weak var delegate: CellSelectable?
    /// Адаптер для конфигурации внутренней коллекции
    private var recipeListAdapter: CVCardAdapter?
    /// Внутренняя коллекция
    private lazy var collectionView: UICollectionView = {
        let layout = TVSingleCell.setupLayout()
        let collectionView = UICollectionView(frame: bounds,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    // MARK: - Functions
    /// Настройка ячейки
    override func setupCell() {
        backgroundColor = .clear
        
        recipeListAdapter = CVCardAdapter()
        collectionView.dataSource = recipeListAdapter
        collectionView.delegate = recipeListAdapter
        collectionView.register(CardCollectionViewCell.self)
        
        setupConstraints()
    }
    
    /// Конфигурирует внутреннюю коллекцию по переданному массиву моделей
    func configure(with models: [CardViewModel]) {
        let builders = CardItemBuilder(width: Constants.widthCardItem,
                                       viewModels: models,
                                       delegate: delegate)
        recipeListAdapter?.configure(with: [builders])
        collectionView.reloadData()
    }

    /// Настройка констрейнтов
    private func setupConstraints() {
        contentView.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

// MARK: - Constants
private extension TVSingleCell {
    static func setupLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let padding: CGFloat = 16
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: padding,
                                           bottom: 0,
                                           right: padding)
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        layout.scrollDirection = .horizontal
        return layout
    }
    
    struct Constants {
        static let widthCardItem: CGFloat = 300
    }
}
