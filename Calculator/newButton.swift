//
//  newButton.swift
//  Calculator
//
//  Created by Daniel on 14/11/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import UIKit

class HighlightedButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? #colorLiteral(red: 0.4129547775, green: 0.3334649801, blue: 0.2647105157, alpha: 1) : #colorLiteral(red: 0.2691211402, green: 0.215608567, blue: 0.1703320742, alpha: 1)
        }
    }
}

class otherButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? #colorLiteral(red: 0.4244858027, green: 0.2182849944, blue: 0.1632626653, alpha: 1) : #colorLiteral(red: 0.2787650228, green: 0.1442221403, blue: 0.1060459092, alpha: 1)
        }
    }
}

class whiteButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? #colorLiteral(red: 0.7693150043, green: 0.7647432089, blue: 0.7728301883, alpha: 1) : #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        }
    }
}
