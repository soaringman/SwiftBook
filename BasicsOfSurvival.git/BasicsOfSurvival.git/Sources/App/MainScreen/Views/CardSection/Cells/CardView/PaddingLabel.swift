//
//  PaddingLabel.swift
//  BasicsOfSurvival
//
//  Created by Владимир Рубис on 19.01.2023.
//

import UIKit

/// #Лейбл с отступами
final class PaddingLabel: UILabel {
    /// Отступы по дефолту
    private var topInset: CGFloat = 6.0
    private var bottomInset: CGFloat = 6.0
    private var leftInset: CGFloat = 12.0
    private var rightInset: CGFloat = 12.0

    /// Дополнительный инициализатор для определения отступов
    convenience init(topInset: CGFloat,
                     bottomInset: CGFloat,
                     leftInset: CGFloat,
                     rightInset: CGFloat) {
        self.init()
        self.topInset = topInset
        self.bottomInset = bottomInset
        self.leftInset = leftInset
        self.rightInset = rightInset
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
