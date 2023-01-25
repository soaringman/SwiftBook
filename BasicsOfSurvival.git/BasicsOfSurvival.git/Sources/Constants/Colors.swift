//
//  Colors.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 25.01.2023.
//

import UIKit

/// #Варианты цветов от самого насыщенного к самому блеклому
enum Colors {
    case color100, color80, color60, color40, color20
}

/// #Установленные цвета
extension Colors {
    var green: UIColor {
        switch self {
        case .color100: return #colorLiteral(red: 0.3495380282, green: 0.4678116441, blue: 0.2167895436, alpha: 1) // #48662A
        case .color80: return #colorLiteral(red: 0.4999451041, green: 0.5860083699, blue: 0.4072844386, alpha: 1) // #6D8555
        case .color60: return #colorLiteral(red: 0.568627451, green: 0.6392156863, blue: 0.4980392157, alpha: 1) // #91A37F
        case .color40: return #colorLiteral(red: 0.7137254902, green: 0.7607843137, blue: 0.6666666667, alpha: 1) // #B6C2AA
        case .color20: return #colorLiteral(red: 0.8549019608, green: 0.8784313725, blue: 0.831372549, alpha: 1) // #DAE0D4
        }
    }
    
    var silver: UIColor {
        switch self {
        case .color100: return #colorLiteral(red: 0.8274509804, green: 0.8352941176, blue: 0.8705882353, alpha: 1) // #D3D5DE
        case .color80: return #colorLiteral(red: 0.8745098039, green: 0.8823529412, blue: 0.9098039216, alpha: 1) // #DFE1E8
        case .color60: return #colorLiteral(red: 0.9098039216, green: 0.9137254902, blue: 0.9333333333, alpha: 1) // #E8E9EE
        case .color40: return #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9647058824, alpha: 1) // #F3F4F6
        case .color20: return #colorLiteral(red: 0.9647058824, green: 0.968627451, blue: 0.9725490196, alpha: 1) // #F6F7F8
        }
    }
}

struct OtherColors {
    static let ringProgressPrimaryColor: UIColor = #colorLiteral(red: 0.1607843137, green: 0.7254901961, blue: 0.3725490196, alpha: 1)
    static let ringProgressSecondaryColor: UIColor = #colorLiteral(red: 0.2823529412, green: 0.4, blue: 0.1647058824, alpha: 0.5495854592)
    static let paddingLabelBGColor: UIColor = #colorLiteral(red: 0.1868853271, green: 0.2424373627, blue: 0.2139189541, alpha: 0.9025829082)
}


