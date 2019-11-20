//
//  anotherButton.swift
//  Calculator
//
//  Created by Daniel on 14/11/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import UIKit

class otherButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .white : #colorLiteral(red: 0.2787650228, green: 0.1442221403, blue: 0.1060459092, alpha: 1)
        }
    }
}
