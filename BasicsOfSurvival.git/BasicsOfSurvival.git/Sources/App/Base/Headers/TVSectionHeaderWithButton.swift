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
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// Кнопка в заголовке
    private lazy var headerButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        
        button.setTitleColor(Colors.color100.green, for: .normal)
        button.addTarget(self,
                         action: #selector(changeLayoutButtonTapped),
                         for: .touchUpInside)
        button.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(titleSectionLabel)
        addSubview(headerButton)

        let padding: CGFloat = 16

        NSLayoutConstraint.activate([
            titleSectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleSectionLabel.trailingAnchor.constraint(equalTo: headerButton.leadingAnchor, constant: -padding / 2),
            titleSectionLabel.topAnchor.constraint(equalTo: topAnchor),
            titleSectionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            headerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            headerButton.topAnchor.constraint(equalTo: titleSectionLabel.topAnchor),
            headerButton.bottomAnchor.constraint(equalTo: titleSectionLabel.bottomAnchor)
        ])
    }
    
    /// Нажали на кнопку
    @objc private func changeLayoutButtonTapped() {
        guard let action = action,
              let section = section else { return }
        action(section)
    }
}

