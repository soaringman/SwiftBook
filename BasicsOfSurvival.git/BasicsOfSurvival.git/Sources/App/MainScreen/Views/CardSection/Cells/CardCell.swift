//
//  CardCell.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 19.01.2023.
//

import UIKit

/// #Ячейка коллекции с карточкой курса
final class CardCell: UICollectionViewCell {
    /// Карточка курса
    private lazy var cardView = CardView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: CardViewModel) {
        cardView.configure(with: model)
    }

    /// Настройка констрейнтов
    private func setupConstraints() {
        backgroundColor = .clear
        cardView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(cardView)

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
