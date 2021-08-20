//
//  Extensions.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import UIKit

import UIKit

extension UITableView {
    func register(cell: UITableViewCell.Type) {
        register(cell, forCellReuseIdentifier: cell.identifier)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIView {
    func addConstraints(_ constraintMaker: (UIView) -> [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraintMaker(self))
    }
}
