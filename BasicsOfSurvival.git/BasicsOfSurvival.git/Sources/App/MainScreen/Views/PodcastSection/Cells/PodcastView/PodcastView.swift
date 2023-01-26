//
//  PodcastView.swift
//  BasicsOfSurvival.git
//
//  Created by Kislov Vadim on 25.01.2023.
//

import UIKit

/// Вью Карточки подкаста
final class PodcastView: BaseView {
    ///  Вью для изображения карточки подкаста
    private lazy var podcastImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 7
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    /// Контейнер для лейбла названия подкаста
    private lazy var podcastLabelContainer: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    /// Лейбл названия подкаста
    private lazy var podcastNameLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.numberOfLines = 2
        label.font = Fonts.main
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Стек для иконки таймера и длительности подкаста
    private lazy var durationStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.distribution = .fill
        
        return stackView
    }()
    
    /// Лейбл длительности подкаста
    private lazy var podcastDuration: UILabel = {
        let label = UILabel()
        
        label.textColor = .systemGray
        label.font = Fonts.annotation
        
        return label
    }()
    
    /// Иконка таймера
    private lazy var durationIconImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "timer")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    func configure(with model: PodcastViewModel) {
        podcastNameLabel.text = model.podcastName
        podcastDuration.text = model.podcastDurationForLabel
        podcastImageView.image = UIImage(named: model.imageName ?? "default")
    }
    
    override func setupView() {
        durationStackView.addArrangedSubview(durationIconImageView)
        durationStackView.addArrangedSubview(podcastDuration)
        
        podcastLabelContainer.addSubview(podcastNameLabel)
        
        self.addSubview(podcastImageView)
        self.addSubview(podcastLabelContainer)
        self.addSubview(durationStackView)
        
        setupConstraints()
    }
    
    /// Настройка констрейнтов
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            podcastImageView.topAnchor.constraint(equalTo: self.topAnchor),
            podcastImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            podcastImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            podcastImageView.heightAnchor.constraint(equalTo: self.widthAnchor),
            podcastImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            podcastLabelContainer.topAnchor.constraint(equalTo: podcastImageView.bottomAnchor, constant: 11),
            podcastLabelContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            podcastLabelContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            podcastLabelContainer.heightAnchor.constraint(equalToConstant: 40),
            
            podcastNameLabel.topAnchor.constraint(equalTo: podcastLabelContainer.topAnchor),
            podcastNameLabel.leadingAnchor.constraint(equalTo: podcastLabelContainer.leadingAnchor),
            podcastNameLabel.trailingAnchor.constraint(equalTo: podcastLabelContainer.trailingAnchor),
                        
            durationStackView.topAnchor.constraint(equalTo: podcastLabelContainer.bottomAnchor, constant: 8),
            durationStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            durationStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            durationStackView.heightAnchor.constraint(equalToConstant: 18),
            durationStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            
            durationIconImageView.heightAnchor.constraint(equalTo: durationStackView.heightAnchor),
            durationIconImageView.widthAnchor.constraint(equalTo: durationStackView.heightAnchor),
        ])
    }
}
