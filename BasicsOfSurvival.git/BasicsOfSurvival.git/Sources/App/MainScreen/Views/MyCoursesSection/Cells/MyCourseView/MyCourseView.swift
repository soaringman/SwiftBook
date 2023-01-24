//
//  MyCourseView.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Вью карточки курса в процессе прохождения (В РАБОТЕ)
final class MyCourseView: BaseView {
    // MARK: - Properties
    /// Действие при нажатии на кнопку
    private var action: (() -> Void)?
    
    private lazy var separateView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var courseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var courseLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.main
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratioCoursesLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.annotation
        label.textColor = #colorLiteral(red: 0.4276415706, green: 0.5208479166, blue: 0.3311662376, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: ЗАМЕНИТЬ НА ПОЛЬЗОВАТЕЛЬСКИЙ
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    // MARK: - Functions
    func configure(with model: MyCourseViewModel,
                   action: (() -> Void)?) {
        self.action = action
        courseLabel.text = "\(model.courseName)\n\(model.shortDescription)"
        ratioCoursesLabel.text = "\(model.passedTests)/\(model.totalTests)"
        
        if let imageName = model.imageName {
            courseImageView.image = UIImage(named: imageName)
        }
    }
    
    override func setupView() {
        
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(courseImageView)
        addSubview(courseLabel)
        addSubview(progressView)
        addSubview(ratioCoursesLabel)
        
        NSLayoutConstraint.activate([
            courseImageView.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            courseImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            courseImageView.trailingAnchor.constraint(equalTo: courseLabel.leadingAnchor, constant: -12),
            courseImageView.widthAnchor.constraint(equalToConstant: 80),
            courseImageView.heightAnchor.constraint(equalTo: courseImageView.widthAnchor),
            
            courseLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            courseLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            courseLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
            
            progressView.leadingAnchor.constraint(equalTo: courseLabel.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: courseLabel.trailingAnchor),
            progressView.bottomAnchor.constraint(equalTo: ratioCoursesLabel.topAnchor, constant: 4),
            
            ratioCoursesLabel.leadingAnchor.constraint(equalTo: courseLabel.leadingAnchor),
            ratioCoursesLabel.trailingAnchor.constraint(equalTo: courseLabel.trailingAnchor),
            ratioCoursesLabel.bottomAnchor.constraint(equalTo: courseImageView.bottomAnchor, constant: -3)
        ])
    }
}