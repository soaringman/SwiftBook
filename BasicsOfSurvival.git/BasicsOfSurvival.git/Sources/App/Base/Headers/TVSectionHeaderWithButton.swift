//
//  TVSectionHeaderWithButton.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 20.01.2023.
//

import UIKit

/// #Вью для кастомного заголовка секции таблицы с кнопкой
final class TVSectionHeaderWithButton: UIView {
    // MARK: - Properties
    /// Действие при нажатии на кнопку
    private var action: ((Int) -> Void)?
    /// Номер секции
    private var section: Int?
    
    /// Название секции
    private lazy var titleSectionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.subtitle
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// Кнопка в заголовке
    private lazy var headerButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setTitleColor(.black.withAlphaComponent(0.5), for: .normal)
        button.addTarget(self,
                         action: #selector(changeLayoutButtonTapped),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    /// Контейнер для элементов
    private lazy var container: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    /// Настраивает содержимое заголовка
    func configure(model: HeaderSectionModel,
                   section: Int?) {
        self.action = model.action
        self.section = section
        
        titleSectionLabel.text = model.titleSection

        if let title = model.titleButton {
            headerButton.setTitle(title,
                                  for: .normal)
        }
        
        if let image = model.imageButton {
            headerButton.setImage(image,
                                  for: .normal)
        }
    }
    
    /// Настраивает констрейнты
    private func setupConstraints() {
        addSubview(container)
        container.addArrangedSubview(titleSectionLabel)
        container.addArrangedSubview(headerButton)

        let padding: CGFloat = 16

        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: padding),
            container.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -padding),
            container.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            container.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }

    /// Нажали на кнопку
    @objc private func changeLayoutButtonTapped() {
        guard let action = action,
              let section = section else { return }
        action(section)
    }
}

