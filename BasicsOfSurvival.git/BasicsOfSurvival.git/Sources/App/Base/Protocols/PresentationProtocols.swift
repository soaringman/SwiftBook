//
//  PresentationProtocols.swift
//  BasicsOfSurvival.git
//
//  Created by Владимир Рубис on 24.01.2023.
//

import Foundation

/// #Протокол передачи UI-ивента при нажатии на ячейку
protocol CellSelectable: AnyObject {
    /// Ивент нажатия ячейку коллекции
    ///  - Parameter id: идентификатор
    func didSelectItem(id: Int)
}
