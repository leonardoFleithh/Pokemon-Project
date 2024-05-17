//
//  Extensions+UIView.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 14/05/24.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
