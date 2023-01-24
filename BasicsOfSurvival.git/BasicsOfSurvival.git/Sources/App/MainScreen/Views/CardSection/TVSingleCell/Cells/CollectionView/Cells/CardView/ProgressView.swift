//
//  ProgressView.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 19.01.2023.
//

import UIKit

/// #Вью показывающая успеваемость
final class ProgressView: UIView {
    // MARK: - Properties
    /// Процент успеваемости
    private var percent = 50
    /// Ширина линии
    private var borderWidth: CGFloat = 4
    /// Основной цвет
    private var primaryColor: UIColor = #colorLiteral(red: 0.1637479961, green: 0.7240898013, blue: 0.3706274629, alpha: 1)
    /// Вспомогательный цвет
    private var secondaryColor: UIColor = #colorLiteral(red: 0.1595322788, green: 0.2052637935, blue: 0.2344131768, alpha: 0.5495854592)
    
    /// Лейбл с процентами успеваемости
    private lazy var persantageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = Fonts.selected
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// Блюр-вью
    private lazy var blurView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blur = UIVisualEffectView(effect: effect)
        blur.clipsToBounds = true
        blur.alpha = 0.5
        blur.translatesAutoresizingMaskIntoConstraints = false
        return blur
    }()
    
    // MARK: - Init & Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    /// Дополнительный инициализатор для настройки прогресс-линии
    convenience init(borderWidth: CGFloat,
                     primaryColor: UIColor,
                     secondaryWidth: UIColor) {
        self.init()
        self.borderWidth = borderWidth
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryWidth
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawRing()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        blurView.layer.cornerRadius = frame.height / 2 - borderWidth
    }
    
    // MARK: - Functions
    func configure(with percent: Int) {
        persantageLabel.text = "\(percent)%"
        self.percent = percent
    }
    
    /// Рисует изображение в виде кольца для view
    private func drawRing() {
        let startAngle = CGFloat(3 * Double.pi / 2)
        let middleAngle = startAngle - CGFloat(2 * Double.pi) * CGFloat(percent) / 100
        
        partRing(startAngle: startAngle,
                   endAngle: middleAngle,
                   strokeColor: primaryColor,
                   borderWidth: borderWidth)
        partRing(startAngle: middleAngle,
                   endAngle: startAngle - CGFloat(2 * Double.pi),
                   strokeColor: secondaryColor,
                   borderWidth: borderWidth)
    }
    
    /// Рисует часть кольца
    /// - Parameters:
    ///  - startAngle: начальный угол
    ///  - endAngle: конечный угол
    ///  - strokeColor: цвет линии
    ///  - borderWidth: ширина линии
    private func partRing(startAngle: CGFloat,
                          endAngle: CGFloat,
                          strokeColor: UIColor,
                          borderWidth: CGFloat) {
        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let radius = CGFloat(self.frame.width - borderWidth) / 2
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: false)
        path.lineWidth = borderWidth
        strokeColor.setStroke()
        path.stroke()
    }
    
    /// Настройка view
    private func setupView() {
        backgroundColor = .clear
        
        addSubview(blurView)
        addSubview(persantageLabel)
        
        NSLayoutConstraint.activate([
            persantageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            persantageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
            persantageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            persantageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            
            blurView.centerXAnchor.constraint(equalTo: centerXAnchor),
            blurView.centerYAnchor.constraint(equalTo: centerYAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: borderWidth),
            blurView.topAnchor.constraint(equalTo: topAnchor, constant: borderWidth)
        ])
    }
}
