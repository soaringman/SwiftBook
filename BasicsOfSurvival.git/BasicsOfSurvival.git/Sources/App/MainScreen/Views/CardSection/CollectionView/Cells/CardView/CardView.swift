//
//  CardView.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 19.01.2023.
//

import UIKit

/// #Вью Карточки курса
final class CardView: UIView {
    // MARK: - Properties
    /// Вью для изображения карточки курса
    private lazy var cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    /// Лейбл названием курса
    private lazy var courseNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.subtitle
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// Прогресс вью
    private lazy var progressView: RingProgressView = {
        let view = RingProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var numberOfTopicsLabel = PaddingLabel()
    private lazy var numberOfTestsLabel = PaddingLabel()
    private lazy var totalTimeLabel = PaddingLabel()
    
    /// Контейнер под лейблы
    private lazy var container: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Init & Override
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Functions
    func configure(with model: CardViewModel) {
        progressView.configure(with: model.percentageProgress)
        courseNameLabel.text = model.courseName
        
        numberOfTopicsLabel.text = model.numberOfTopics
        numberOfTestsLabel.text = model.numberOfTests
        totalTimeLabel.text = model.totalTime
        
        if let imageName = model.imageName {
            cardImageView.image = UIImage(named: imageName)
        }
    }
    
    /// Настройка view
    private func setupView() {
        [numberOfTopicsLabel, numberOfTestsLabel, totalTimeLabel].forEach {
            $0.textAlignment = .center
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
            $0.font = Fonts.annotation
            $0.backgroundColor = #colorLiteral(red: 0.2745098039, green: 0.2978057265, blue: 0.2777234018, alpha: 0.9)
            $0.textColor = .white
            container.addArrangedSubview($0)
        }
        setupConstraints()
    }
    
    /// Настройка констрейнтов
    private func setupConstraints() {
        cardImageView.addSubview(courseNameLabel)
        cardImageView.addSubview(progressView)
        cardImageView.addSubview(container)
        
        addSubview(cardImageView)
        
        NSLayoutConstraint.activate([
            cardImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardImageView.topAnchor.constraint(equalTo: topAnchor),
            
            courseNameLabel.topAnchor.constraint(equalTo: cardImageView.topAnchor, constant: 18),
            courseNameLabel.leadingAnchor.constraint(equalTo: cardImageView.leadingAnchor, constant: 24),
            courseNameLabel.trailingAnchor.constraint(equalTo: progressView.leadingAnchor, constant: -14),
            
            progressView.topAnchor.constraint(equalTo: cardImageView.topAnchor, constant: 14),
            progressView.trailingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: -14),
            progressView.heightAnchor.constraint(equalToConstant: 54),
            progressView.widthAnchor.constraint(equalTo: progressView.heightAnchor),
            
            container.bottomAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: -18),
            container.leadingAnchor.constraint(equalTo: cardImageView.leadingAnchor, constant: 24)
        ])
    }
    
}
