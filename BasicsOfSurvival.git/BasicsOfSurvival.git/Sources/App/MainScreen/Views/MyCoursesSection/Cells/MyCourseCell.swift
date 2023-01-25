//
//  MyCourseCell.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Ячейка карточки курса в процессе прохождения
final class MyCourseCell: TVBaseCell {
    // MARK: - Properties
    /// Делегат 
    weak var delegate: StudyContinuing?
    /// Вью курса
    private lazy var myCourseView: MyCourseView = {
        var view = MyCourseView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var continueStudyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжить обучение", for: .normal)
        button.setTitleColor(Colors.color100.green, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var playImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = Colors.color100.green
        imageView.image = Icons.play.image
        return imageView
    }()

    private lazy var separateView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.color100.silver
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.addShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.07),
                              radius: 10,
                              opacity: 1,
                              offset: .zero)
        return view
    }()

    // MARK: - Functions
    override func setupCell() {

        setupConstraints()
    }

    /// Конфигурирует вью
    func configure(with model: MyCourseViewModel) {
        let action: (() -> Void)? = { [weak self] in
            self?.delegate?.didTapContinueStudyButton(id: model.id)
        }
        myCourseView.configure(with: model,
                               action: action)
    }

    /// Настройка констрейнтов
    private func setupConstraints() {

        continueStudyButton.addSubview(playImageView)
        container.addSubview(myCourseView)
        container.addSubview(separateView)
        container.addSubview(continueStudyButton)
        contentView.addSubview(container)

        let padding: CGFloat = 16
        let heightButton: CGFloat = 45
        let heightSeparateView: CGFloat = 1

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),

            myCourseView.topAnchor.constraint(equalTo: container.topAnchor),
            myCourseView.bottomAnchor.constraint(equalTo: separateView.topAnchor),
            myCourseView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            myCourseView.trailingAnchor.constraint(equalTo: container.trailingAnchor),

            separateView.bottomAnchor.constraint(equalTo: continueStudyButton.topAnchor),
            separateView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            separateView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            separateView.heightAnchor.constraint(equalToConstant: heightSeparateView),

            continueStudyButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            continueStudyButton.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            continueStudyButton.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            continueStudyButton.heightAnchor.constraint(equalToConstant: heightButton),

            playImageView.centerYAnchor.constraint(equalTo: continueStudyButton.centerYAnchor),
            playImageView.leadingAnchor.constraint(equalTo: continueStudyButton.leadingAnchor, constant: 19),
            playImageView.heightAnchor.constraint(equalToConstant: 15),
            playImageView.widthAnchor.constraint(equalToConstant: 14)
        ])
    }
}
