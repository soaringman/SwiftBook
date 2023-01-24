//
//  MyCourseCell.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

final class MyCourseCell: TVBaseCell {
    // MARK: - Properties
    /// Делегат 
    weak var delegate: MainScreenPresentation?
    /// Вью курса
    private lazy var myCourseView: MyCourseView = {
        var view = MyCourseView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Functions
    /// Настройка ячейки
    override func setupCell() {
        backgroundColor = .clear

        setupConstraints()
    }
    
    /// Конфигурирует вью
    func configure(with model: MyCourseViewModel) {
        let action: (() -> Void)? = { [weak self] in
            self?.delegate?.didTapContinueLearningButton(id: model.id)
        }
        myCourseView.configure(with: model,
                               action: action)
    }
    
    /// Настройка констрейнтов
    private func setupConstraints() {
        contentView.addSubview(myCourseView)
        
        let padding = AppConstants.padding
        let top: CGFloat = 12
        
        NSLayoutConstraint.activate([
            myCourseView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: top),
            myCourseView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            myCourseView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            myCourseView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
}
