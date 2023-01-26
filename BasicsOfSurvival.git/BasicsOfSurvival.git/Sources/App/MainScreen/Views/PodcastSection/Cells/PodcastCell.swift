//
//  PodcastCellCollectionViewCell.swift
//  BasicsOfSurvival.git
//
//  Created by Kislov Vadim on 25.01.2023.
//

import UIKit


/// #Ячейка коллекции с карточкой подкаста
final class PodcastCell: UICollectionViewCell {
    /// Карточка подкаста
    private lazy var podcastView = PodcastView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: PodcastViewModel) {
        podcastView.configure(with: model)
    }
    
    /// Настройка констрейнтов
    private func setupConstraints() {
        self.backgroundColor = .clear
        podcastView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(podcastView)
        
        NSLayoutConstraint.activate([
            podcastView.topAnchor.constraint(equalTo: self.topAnchor),
            podcastView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            podcastView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            podcastView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
