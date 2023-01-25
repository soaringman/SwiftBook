//
//  Icons.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 25.01.2023.
//

import UIKit

/// #Изображения
enum Icons: String {
    case play
}

extension Icons {
    var image: UIImage? {
        UIImage(named: self.rawValue)?.withRenderingMode(.alwaysTemplate)
    }
}
