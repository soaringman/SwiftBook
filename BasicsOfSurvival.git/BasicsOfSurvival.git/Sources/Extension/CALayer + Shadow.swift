//
//  CALayer + Shadow.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 25.01.2023.
//

import UIKit

extension CALayer {
    /// Добавляет тень
    ///  - Parameter shadow: данные тени
    func addShadow(color: UIColor,
                   radius: CGFloat,
                   opacity: Float,
                   offset: CGSize) {
        self.shadowColor = color.cgColor
        self.shadowRadius = radius
        self.shadowOpacity = opacity
        self.shadowOffset = offset
    }
}
