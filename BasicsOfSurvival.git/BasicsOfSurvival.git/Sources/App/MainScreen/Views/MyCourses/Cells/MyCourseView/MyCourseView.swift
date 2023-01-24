//
//  MyCourseView.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import UIKit

/// #Вью карточки курса в процессе прохождения
final class MyCourseView: UIView {
    /// Действие при нажатии на кнопку
    private var action: (() -> Void)?
    
    private lazy var separateView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var courseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var courseLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.main
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
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    func configure(with model: MyCourseViewModel,
                   action: (() -> Void)?) {
        self.action = action
        
    }
    
    func setupConstraints() {
        
        
        
    }
    
}
